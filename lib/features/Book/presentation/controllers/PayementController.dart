import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {

  var finalPrice = ''.obs;

  void initializeData({
    required String price,
  }) {
    finalPrice.value = price;
  }

  void clearFields() {
    finalPrice.value = '';
  }

  @override
  void onClose() {
    super.onClose();
  }
}