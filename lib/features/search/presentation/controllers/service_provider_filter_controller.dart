import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceProviderFilterController extends GetxController {
  var minutePrice = RangeValues(10, 20).obs;
  var experienceYears = RangeValues(1, 5).obs;
  var selectedFilters = <String>[].obs;
  var onlyAvailable = false.obs;

  void updateMinute(RangeValues value) {
    minutePrice.value = value;
  }

  void updateExperienceYears(RangeValues value) {
    experienceYears.value = value;
  }

  onChangeOnlyAvailable() {
    onlyAvailable.value = !onlyAvailable.value;
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
    "محامي",
    "مهندس زراعي",
    "سمسار",
    'مهندس بناء',
    'مكتب عقاري',
    'الكل',
    'مكتب هندسي',
  ];
}
