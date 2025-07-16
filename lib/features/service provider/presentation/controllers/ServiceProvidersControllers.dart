import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants/image_paths.dart';

import '../../../../core/networks/dio_factory.dart';
import '../../data/data_source/expert_service.dart';

class ServiceProviders_Controller extends GetxController {
  var serviceProviders = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchExperts();
  }

  void fetchExperts() async {
    try {
      final dio = DioFactory.getDio();
      final service = ExpertService(dio);
      final response = await service.getExperts(page: 0, size: 10);

      serviceProviders.value = response.data.content.map((expert) {
        return {
          "name": "${expert.user.firstName} ${expert.user.lastName}",
          "jobTitle": expert.profession,
          "rating": expert.rating,
          "experienceYears": expert.experience,
          "imagePath": expert.user.imageUrl.isNotEmpty
              ? expert.user.imageUrl
              : AppImages.noImage,
          "isFavorite": false,
          "isFollowing": false,
          "isExpanded": false,
          "text": expert.bio ?? "",
          "price": expert.perMinuteVideo != null
              ? "${expert.perMinuteVideo!.toInt()} S.P"
              : "غير محدد",
          "textProvider": expert.bio ?? "لا يوجد وصف",
          "rateCount": expert.rateCount,
        };
    }).toList();
    } catch (e) {
      print(" خطأ في جلب الخبراء: $e");
    }
  }

  void toggleFavorite(int index) {
    serviceProviders[index]['isFavorite'] = !serviceProviders[index]['isFavorite'];
    serviceProviders.refresh();
  }

  void toggleExpanded(int index) {
    serviceProviders[index]['isExpanded'] = !(serviceProviders[index]['isExpanded'] ?? false);
    serviceProviders.refresh();
  }

  void toggleFollowing(int index) {
    serviceProviders[index]['isFollowing'] = !(serviceProviders[index]['isFollowing'] ?? false);
    serviceProviders.refresh();
  }

}