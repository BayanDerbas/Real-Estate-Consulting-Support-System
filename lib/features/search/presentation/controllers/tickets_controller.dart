import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketsController extends GetxController {
  var time = RangeValues(1, 5).obs;
  void updateTime(RangeValues value) {
    time.value = value;
  }
}
