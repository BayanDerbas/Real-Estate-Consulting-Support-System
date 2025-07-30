import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import '../../../../core/networks/dio_factory.dart';
import '../../data/data_source/expert_service.dart';

class ServiceProviders_Controller extends GetxController {
  var serviceProviders = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  var isFavoriteList = <int, RxBool>{}.obs;
  var isFollowingList = <int, RxBool>{}.obs;
  var isExpandedList = <int, RxBool>{}.obs;

  var currentPage = 0.obs;
  var totalPages = 1.obs;
  final int pageSize = 10;

  @override
  void onInit() {
    super.onInit();
    fetchExperts();
  }

  void fetchExperts({int page = 0}) async {
    isLoading(true);
    try {
      final dio = DioFactory.getDio();
      final service = ExpertService(dio);
      final response = await service.getExperts(page: page, size: pageSize);

      serviceProviders.value =
          response.data!.content!.asMap().entries.map((entry) {
            final index = entry.key;
            final expert = entry.value;
            isFavoriteList[index] = false.obs;
            isFollowingList[index] = false.obs;
            isExpandedList[index] = false.obs;

            return {
              "id": expert.id,
              "name": "${expert.user?.firstName} ${expert.user?.lastName}",
              "jobTitle": expert.profession,
              "rating": expert.rating,
              "experienceYears": expert.experience,
              "idCardImage": expert.idCardImage,
              "isFavorite": false,
              "isFollowing": false,
              "isExpanded": false,
              "text": expert.bio ?? "",
              "price":
                  expert.perMinuteVideo != null
                      ? "${expert.perMinuteVideo!.toInt()} S.P"
                      : "غير محدد",
              "textProvider": expert.bio ?? "لا يوجد وصف",
              "rateCount": expert.rateCount,
            };
          }).toList();

      // totalPages.value = response.data.totalPages;
      // currentPage.value = response.data.pageable.pageNumber;
    } catch (e) {
      print("خطأ في جلب الخبراء: $e");
    } finally {
      isLoading(false);
    }
  }

  void changePage(int newPage) {
    currentPage.value = newPage;
    fetchExperts(page: newPage);
  }

  void toggleFavorite(int index) {
    if (isFavoriteList.containsKey(index)) {
      isFavoriteList[index]!.value = !isFavoriteList[index]!.value;
    }
  }

  void toggleFollowing(int index) {
    if (isFollowingList.containsKey(index)) {
      isFollowingList[index]!.value = !isFollowingList[index]!.value;
    }
  }

  void toggleExpanded(int index) {
    if (isExpandedList.containsKey(index)) {
      isExpandedList[index]!.value = !isExpandedList[index]!.value;
    }
  }

  String getValidImageUrl(Map<String, dynamic> provider) {
    final url = provider['imagePath']?.toString() ?? '';
    if (url.isEmpty || !url.contains('.')) {
      return AppImages.noImage;
    }
    return url;
  }
}
