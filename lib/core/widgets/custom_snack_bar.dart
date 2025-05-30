import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

customSnackBar({
  required String title,
  required String message,
  bool isDone = true,
  bool withDuration = true,
  bool isDismissible = true,
}) {
  Get.closeCurrentSnackbar();
  return Get.showSnackbar(
    GetSnackBar(
      duration: withDuration ? const Duration(milliseconds: 1500) : null,
      isDismissible: isDismissible,
      title: title,
      message: message,
      icon:
          isDone
              ? const Icon(Icons.done_all, color: AppColors.pureWhite)
              : const Icon(Icons.warning_amber, color: Colors.red),
    ),
  );
}
