import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/image_paths.dart';

import '../pages/PropertyDetails.dart';
import '../widgets/Custom_Properties.dart';

class PropertiesController extends GetxController {
  var SelectedIndex = (-1).obs;

  void selectedIndex(int index) {
    SelectedIndex.value = index;
  }

  void goToDetails(int index) {
    selectedIndex(index);
    Get.to(() => PropertyDetails());
  }

  final List<CustomProperties> propertiesList = [
    CustomProperties(
      imagePath: AppImages.villa,
      place: 'Qalamoun, Deir Atiyah',
      propertType: 'Villa',
      propertyIcon: Icons.villa,
      onTap: () {
        Get.find<PropertiesController>().goToDetails(0);
      },
    ),
    CustomProperties(
      imagePath:AppImages.property4,
      place: 'Damascus, Mezzeh',
      propertType: 'Apartment',
      propertyIcon: Icons.apartment,
      onTap: () {
        Get.find<PropertiesController>().goToDetails(1);
      },
    ),
    CustomProperties(
      imagePath:AppImages.store,
      place: 'Aleppo, Downtown',
      propertType: 'Store',
      propertyIcon: Icons.store,
      onTap: () {
        Get.find<PropertiesController>().goToDetails(2);
      },
    ),
  ];
}
