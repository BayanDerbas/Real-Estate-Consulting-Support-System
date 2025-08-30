import 'package:get/get.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/features/service%20provider/data/repository/favourite_unfavorite/favourite_unfavourite_repository.dart';
import 'package:graduation_project/features/service%20provider/data/repository/follow_unfollow/follow_unfollow_repository.dart';
import '../../../../core/networks/dio_factory.dart';
import '../../../../core/utils/secure_storage.dart';
import '../../data/data_source/expert_service.dart';

class ServiceProviders_Controller extends GetxController {
  final Follow_UnFollow_Repository repository;
  final Favourite_UnFavourite_Repository repository_;
  var serviceProviders = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  var isFavoriteList = <int, RxBool>{}.obs;
  var isFollowingList = <int, RxBool>{}.obs;
  var isExpandedList = <int, RxBool>{}.obs;
  var currentPage = 0.obs;
  var totalPages = 1.obs;
  final int pageSize = 10;
  var role = ''.obs;

  ServiceProviders_Controller(this.repository,this.repository_);

  @override
  void onInit() {
    super.onInit();
    _loadRole();
    fetchExperts();
  }

  Future<void> _loadRole() async {
    final storage = SecureStorage();
    role.value = await storage.getUserType() ?? '';
  }

  Future<void> fetchExperts({int page = 0}) async {
    isLoading(true);
    try {
      final dio = DioFactory.getDio();
      final service = ExpertService(dio);
      final response = await service.getExperts(page: page, size: pageSize);

      serviceProviders.value = response.data!.content!.map((expert) {
        final expertId = expert.id;
        if (expertId == null) return null;

        isFavoriteList[expertId] = false.obs;
        isFollowingList[expertId] = false.obs;
        isExpandedList[expertId] = false.obs;

        return {
          "id": expertId,
          "name":
          "${expert.user?.firstName ?? ''} ${expert.user?.lastName ?? ''}",
          "jobTitle": expert.profession,
          "rating": expert.rating,
          "experienceYears": expert.experience,
          "idCardImage": expert.user?.imageUrl,
          "isFavorite": false,
          "isFollowing": false,
          "isExpanded": false,
          "text": expert.bio ?? "",
          "price": [
            expert.perMinuteVideo != null
                ? "${expert.perMinuteVideo!.toInt()} S.P (فيديو)"
                : null,
            expert.perMinuteAudio != null
                ? "${expert.perMinuteAudio!.toInt()} S.P (صوت)"
                : null,
          ].whereType<String>().join("\n"),
          "textProvider": expert.bio ?? "لا يوجد وصف",
          "rateCount": expert.rateCount,
        };
      }).where((e) => e != null).cast<Map<String, dynamic>>().toList();

      await _initUserState();
    } catch (e) {
      print("خطأ في جلب الخبراء: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> _initUserState() async {
    final result = await repository.getMeClient();
    result.fold(
          (failure) {
        print("❌ فشل في جلب بيانات المستخدم: ${failure.err_message}");
      },
          (me) {
        final followers = me.data.followers;

        for (var expertId in followers) {
          if (isFollowingList.containsKey(expertId)) {
            isFollowingList[expertId]!.value = true;
          } else {
            isFollowingList[expertId] = true.obs;
          }
        }

        serviceProviders.forEach((provider) {
          final id = provider["id"];
          if (followers.contains(id)) {
            provider["isFollowing"] = true;
          }
        });

        final favorites = me.data.favorites;
        for (var expertId in favorites) {
          if (isFavoriteList.containsKey(expertId)) {
            isFavoriteList[expertId]!.value = true;
          } else {
            isFavoriteList[expertId] = true.obs;
          }
        }
      },
    );
  }

  Future<void> followExpert(int expertId) async {
    try {
      final result = await repository.followExpert(expertId);
      result.fold(
            (failure) {
          print("❌ فشل في المتابعة: ${failure.err_message}");
          Get.snackbar("Error", "فشل في المتابعة");
        },
            (_) {
          isFollowingList[expertId]?.value = true;
          Get.snackbar("Success", "تمت المتابعة");
        },
      );
    } catch (e) {
      print("❌ خطأ في followExpert: $e");
      Get.snackbar("Error", "فشل في المتابعة");
    }
  }

  Future<void> unfollowExpert(int expertId) async {
    try {
      final result = await repository.unfollowExpert(expertId);
      result.fold(
            (failure) {
          print("❌ فشل في إلغاء المتابعة: ${failure.err_message}");
          Get.snackbar("Error", "فشل في إلغاء المتابعة");
        },
            (_) {
          isFollowingList[expertId]?.value = false;
          Get.snackbar("Success", "تم إلغاء المتابعة");
        },
      );
    } catch (e) {
      print("❌ خطأ في unfollowExpert: $e");
      Get.snackbar("Error", "فشل في إلغاء المتابعة");
    }
  }

  Future<void> favouriteExpert(int expertId) async {
    try {
      final result = await repository_.favouriteExpert(expertId);
      result.fold(
            (failure) {
          print("❌ فشل في إضافة المفضلة: ${failure.err_message}");
          Get.snackbar("Error", "فشل في الإضافة للمفضلة");
        },
            (_) {
          isFavoriteList[expertId]?.value = true;
          Get.snackbar("Success", "تمت الإضافة إلى المفضلة");
        },
      );
    } catch (e) {
      print("❌ خطأ في favouriteExpert: $e");
      Get.snackbar("Error", "فشل في الإضافة للمفضلة");
    }
  }

  Future<void> unfavouriteExpert(int expertId) async {
    try {
      final result = await repository_.unfavouriteExpert(expertId);
      result.fold(
            (failure) {
          print("❌ فشل في إلغاء المفضلة: ${failure.err_message}");
          Get.snackbar("Error", "فشل في الإلغاء من المفضلة");
        },
            (_) {
          isFavoriteList[expertId]?.value = false;
          Get.snackbar("Success", "تم الإلغاء من المفضلة");
        },
      );
    } catch (e) {
      print("❌ خطأ في unfavouriteExpert: $e");
      Get.snackbar("Error", "فشل في الإلغاء من المفضلة");
    }
  }

  Future<void> toggleFavorite(int expertId) async {
    final isFav = isFavoriteList[expertId]?.value ?? false;
    if (isFav) {
      await unfavouriteExpert(expertId);
    } else {
      await favouriteExpert(expertId);
    }
  }

  void toggleExpanded(int expertId) {
    if (isExpandedList.containsKey(expertId)) {
      isExpandedList[expertId]!.value = !isExpandedList[expertId]!.value;
    }
  }

  String getValidImageUrl(Map<String, dynamic> provider) {
    final url = provider['idCardImage']?.toString() ?? '';
    if (url.isEmpty || !url.contains('.')) {
      return AppImages.noImage;
    }
    return url;
  }
}