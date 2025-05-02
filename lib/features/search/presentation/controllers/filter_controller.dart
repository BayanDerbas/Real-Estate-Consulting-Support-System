import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  var sliderValue = RangeValues(10, 20).obs;

  void updateSliderValue(RangeValues value) {
    sliderValue.value = value;
  }
}
