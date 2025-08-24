import 'dart:ui';
import 'package:get/get.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../core/networks/dio_factory.dart';
import '../../../../core/utils/secure_storage.dart';
import '../../../officers/data/data_source/office_service.dart';
import '../../data/data_source/expert_service.dart';
import '../../data/data_source/get_properties_by_officeId/properties_by_officeId_service.dart';
import '../../data/model/get_properties_by_officeId/propertiesByOfficeId_model.dart';
import '../../data/repository/properties_by_officeId_repository.dart';

class ServiceProviderProfileController extends GetxController {
  final String id;
  final String role;

  ServiceProviderProfileController(this.id, this.role);

  var isFollowing = false.obs;
  var isFavourite = false.obs;
  var followers = 18.obs;
  var isLoading = false.obs;
  final RxMap<String, dynamic> serviceProvider = <String, dynamic>{}.obs;

  String get followersText => "Sara and ${followers.value - 1} others";

  final postImages = [
    AppImages.property1,
    AppImages.property2,
    AppImages.garden,
    AppImages.user,
    AppImages.expert,
    AppImages.property3,
  ];

  final List<Color> discountColors = [
    AppColors.lavender,
    AppColors.softPink,
    AppColors.babySky,
    AppColors.aquaBlue,
    AppColors.goldenYellow,
    AppColors.blushRose,
  ];

  final List<Map<String, String>> discounts = [
    {
      'discount': '%30 OFF',
      'description': 'خصم 5000 لـ سن صالح لمرة واحدة',
      'code': 'عقارك',
    },
    {
      'discount': '%100 OFF',
      'description': 'احصل على استشارة مجانية بالكامل\nبعد حجز استشارتين',
      'code': '',
    },
    {
      'discount': '%30 OFF',
      'description': 'خصم خاص على العقارات السكنية',
      'code': '',
    },
    {
      'discount': '%30 OFF',
      'description': 'خصم على خدمات التقييم العقاري',
      'code': '',
    },
    {
      'discount': '%30 OFF',
      'description': 'خصم 5000 لـ سن صالح لمرة واحدة',
      'code': 'عقارك',
    },
    {
      'discount': '%100 OFF',
      'description': 'احصل على استشارة مجانية بالكامل\nبعد حجز استشارتين',
      'code': '',
    },
    {
      'discount': '%30 OFF',
      'description': 'خصم على خدمات التقييم العقاري',
      'code': '',
    },
    {
      'discount': '%30 OFF',
      'description': 'خصم 5000 لـ سن صالح لمرة واحدة',
      'code': 'عقارك',
    },
  ];
  var properties = <Property>[].obs;

  @override
  void onInit() {
    super.onInit();
    print("ID المستلم في البروفايل: $id");
    fetchProviderByIdAndRole(id, role);
  }

  String getValidImageUrl(Map<String, dynamic> provider) {
    final rawImage = provider['userImage']?.toString()?.trim() ??
        provider['idCardImage']?.toString()?.trim() ??
        '';
    final isNetwork =
        rawImage.startsWith('http://') || rawImage.startsWith('https://');
    final hasExtension = rawImage.split('/').last.contains('.');
    if (isNetwork && hasExtension) {
      return rawImage;
    }
    return AppImages.noImage;
  }

  void fetchProviderByIdAndRole(String id, String role) async {
    try {
      isLoading.value = true;
      final dio = DioFactory.getDio();

      if (role == "EXPERT") {
        final expertService = ExpertService(dio);
        final response = await expertService.getExpertById(id);

        print("استجابة الخبير: ${response.toJson()}");

        final expert = response.data;

        if (expert == null) {
          throw Exception('لا يوجد خبير في الاستجابة');
        }

        serviceProvider.value = {
          "name":
              "${expert.user?.firstName} ${expert.user?.lastName}"
                      .trim()
                      .isEmpty
                  ? "بدون اسم"
                  : "${expert.user?.firstName} ${expert.user?.lastName}".trim(),
          "jobTitle": expert.profession,
          "rating": expert.rating,
          "experienceYears": int.tryParse(expert.experience!) ?? 0,
          "idCardImage":
              expert.idCardImage?.isNotEmpty == true
                  ? expert.idCardImage!
                  : AppImages.noImage,
          "textProvider": expert.bio ?? "لا يوجد وصف",
          "price":
              expert.perMinuteVideo != null
                  ? "${expert.perMinuteVideo!.toInt()} S.P"
                  : "غير محدد",
          "rateCount": expert.rateCount,
          "role": "EXPERT",
        };
      } else if (role == "OFFICE") {
        final officeService = OfficeService(dio);
        final response = await officeService.getAllOffices(page: 0, size: 50);
        final office = response.data?.content?.firstWhere(
          (e) => e.id.toString() == id,
          orElse: () => throw Exception('لم يتم العثور على المكتب'),
        );

        serviceProvider.value = {
          "name":
              "${office?.user?.firstName} ${office?.user?.lastName}"
                      .trim()
                      .isEmpty
                  ? "بدون اسم"
                  : "${office?.user?.firstName} ${office?.user?.lastName}"
                      .trim(),
          "jobTitle": "OFFICE",
          "rating": "4.5",
          "experienceYears": 0,
          "idCardImage":
              office?.commercialRegisterImage?.isNotEmpty == true
                  ? office?.commercialRegisterImage
                  : AppImages.noImage,
          "textProvider": office?.bio ?? "لا يوجد وصف",
          "price": "غير محدد",
          "rateCount": 0,
          "role": "OFFICE",
        };
        final propertyService = PropertiesByOfficeidService(dio);
        final repo = PropertiesByOfficeIdRepository(propertyService);
        final result = await repo.getPropertiesByOfficeId(officeId: int.parse(id));

        result.fold(
              (failure) {
            print("خطأ في جلب العقارات: ${failure.err_message}");
            properties.clear();
          },
              (success) {
            properties.assignAll(success.data.content);
          },
        );
      }
      final storage = SecureStorage();

      final String? userId = await storage.getUserId();
      final String? userName = await storage.getUserName();
      final String? userType = await storage.getUserType();
      final String? email = await storage.getEmail();
      final String? profileImage = await storage.getProfileImage();

      if (userId == null) {
        isLoading.value = false;
        print("خطأ: لم يتم العثور على معرف المستخدم");
      }

      print("========== Current User Info ==========");
      print("ID: $userId");
      print("Name: $userName");
      print("Role: $userType");
      print("Email: $email");
      print("Profile Image: $profileImage");
      print("======================================");
    } catch (e, stackTrace) {
      print("خطأ في جلب المزود: $e");
      print("Stack Trace: $stackTrace");
      serviceProvider.clear();
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFavourite() {
    isFavourite.value = !isFavourite.value;
  }

  void toggleFollow() {
    isFollowing.value = !isFollowing.value;
    if (isFollowing.value) {
      followers.value--;
    } else {
      followers.value++;
    }
  }
}
