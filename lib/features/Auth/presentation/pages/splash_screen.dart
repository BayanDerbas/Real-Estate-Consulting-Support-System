import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/refresh_token_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final RefreshTokenController controller = Get.find();

  @override
  void initState() {
    super.initState();
    _handleStartupLogic();
  }

  Future<void> _handleStartupLogic() async {
    final refreshToken = await controller.storage.getRefreshToken();
    log("Loaded refresh token: $refreshToken");

    if (refreshToken != null && refreshToken.isNotEmpty) {
      final success = await controller.refreshToken();
      if (success) {
       // Get.offAllNamed(AppRoutes.createProperty);
        return;
      }
    }

    Get.offAllNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: Stack(
        fit: StackFit.expand,
        children: [Image.asset(AppImages.appLogo, fit: BoxFit.cover)],
      ),
    );
  }
}
