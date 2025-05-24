import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmController extends GetxController {
  final discountCodeController = TextEditingController();

  @override
  void onClose() {
    discountCodeController.dispose();
    super.onClose();
  }

  void confirmBooking() {
    final code = discountCodeController.text.trim();
    if (code.isNotEmpty) {
      Get.snackbar("تم", "تم استخدام الكود: $code");
    } else {
      Get.snackbar("تنبيه", "الرجاء إدخال كود الخصم إذا وُجد");
    }
  }
}