import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/Custom_Properties.dart';

class PropertiesController extends GetxController{
  var SelectedIndex = (-1).obs;

  void selectedIndex(int index){
    SelectedIndex.value = index;
  }

  final List<CustomProperties> propertiesList = [
    CustomProperties(
      imagePath: 'assets/images/villa.jpg',
      place: 'Qalamoun, Deir Atiyah',
      propertType: 'Villa',
      propertyIcon: Icons.villa,
    ),
    CustomProperties(
      imagePath: 'assets/images/property4.jpg',
      place: 'Damascus, Mezzeh',
      propertType: 'Apartment',
      propertyIcon: Icons.apartment,
    ),
    CustomProperties(
      imagePath: 'assets/images/store.jpg',
      place: 'Aleppo, Downtown',
      propertType: 'Store',
      propertyIcon: Icons.store,
    ),
  ];

}