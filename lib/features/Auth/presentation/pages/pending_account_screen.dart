import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/styles.dart';

class AccountPendingPage extends StatelessWidget {
  const AccountPendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepNavy,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.pureWhite),
          onPressed: () => Get.back(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'تم تسجيل حسابك'.tr,
                textAlign: TextAlign.center,
                style: setTextStyle(
                  GoogleFonts.michroma,
                  25,
                  AppColors.pureWhite,
                  FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'لقد تم تسجيل حسابك لكن سيبقى في حالة التعليق حتى تتم الموافقة عليه من قبل الأدمن',
                textAlign: TextAlign.center,
                style: setTextStyle(
                  GoogleFonts.poppins,
                  16,
                  AppColors.pureWhite.withOpacity(0.9),
                  FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
