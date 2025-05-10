import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PropertyFilterController extends GetxController {
  var propertyPrice = RangeValues(10, 20).obs;
  var propertySize = RangeValues(1, 5).obs;
  var selectedFilters = <String>[].obs;
  void updatePropertyPrice(RangeValues value) {
    propertyPrice.value = value;
  }

  void updatePropertySize(RangeValues value) {
    propertySize.value = value;
  }

  void selectFilter(String filter) {
    if (selectedFilters.contains(filter)) {
      selectedFilters.remove(filter);
    } else {
      selectedFilters.add(filter);
    }
  }

  bool isSelected(String filter) => selectedFilters.contains(filter);

  final List<String> filters = [
    "أرض",
    "منشأة صناعية",
    "فيلا",
    'محل تجاري',
    'بيت',
    'الكل',
  ];
}
