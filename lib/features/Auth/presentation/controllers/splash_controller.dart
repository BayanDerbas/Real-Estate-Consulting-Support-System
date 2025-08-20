import 'dart:async';

import 'package:get/get.dart';
import 'package:graduation_project/core/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(Duration(seconds: 2), () => Get.offNamed(AppRoutes.login));
    super.onInit();
  }
}
