import 'package:get/get.dart';
import 'package:graduation_project/core/constants/image_paths.dart';

class ServiceProvider_Controller extends GetxController {
  var serviceProviders = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    serviceProviders.value = [
      {
        "name": "Eng. Ahmed",
        "jobTitle": "Architect",
        "rating": 4.8,
        "experienceYears": 10,
        "successfulCases": 50,
        "appointmentDate": "2025-05-01",
        "appointmentTime": "10:00 AM",
        "imagePath": AppImages.expert,
        "isFavorite": false,
        "isExpanded": false,
        "text": "this is for low service",
        "textProvider": "اقوم بصياغة ومراجعة وفحص الوثائق والعقود العقارية",
        "price": "2000 S.P",
      },
      {
        "name": "Eng. Sarah",
        "jobTitle": "Landscape Designer",
        "rating": 4.5,
        "experienceYears": 8,
        "successfulCases": 30,
        "appointmentDate": "2025-05-02",
        "appointmentTime": "12:00 PM",
        "imagePath": AppImages.expert,
        "isFavorite": false,
        "isExpanded": false,
        "text": "this is for low service",
        "textProvider": "اقوم بصياغة ومراجعة وفحص الوثائق والعقود العقارية",
        "price": "2000 S.P",
      },
    ];
  }

  void toggleFavorite(int index) {
    serviceProviders[index]['isFavorite'] = !serviceProviders[index]['isFavorite'];
    serviceProviders.refresh();
  }

  void toggleExpanded(int index) {
    serviceProviders[index]['isExpanded'] = !(serviceProviders[index]['isExpanded'] ?? false);
    serviceProviders.refresh();
  }
}
