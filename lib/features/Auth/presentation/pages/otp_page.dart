import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/styles.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/verification_code_controller.dart';
import '../../../../core/widgets/custom_otp.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VerificationCodeController>();

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
                'Verification Code',
                style: setTextStyle(
                  GoogleFonts.michroma,
                  30,
                  AppColors.pureWhite,
                  FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Enter the 6-digit code sent to',
                style: setTextStyle(
                  GoogleFonts.poppins,
                  16,
                  AppColors.pureWhite.withOpacity(0.8),
                  FontWeight.normal,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                controller.email.text,
                style: setTextStyle(
                  GoogleFonts.poppins,
                  16,
                  AppColors.pureWhite,
                  FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () => Get.back(),
                child: Text(
                  'Wrong email address?',
                  style: TextStyle(
                    color: AppColors.babySky,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              OTPInput(
                onCompleted: (code) {
                  controller.code.text = code;
                  controller.verificationCode();
                },
              ),
              const SizedBox(height: 20),
              Obx(() {
                if (controller.errMessage.value.isNotEmpty) {
                  return Text(
                    controller.errMessage.value,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                    textAlign: TextAlign.center,
                  );
                }
                return const SizedBox.shrink();
              }),
              const SizedBox(height: 20),
              Obx(() {
                if (controller.canResend.value) {
                  return GestureDetector(
                    onTap: controller.resendCode,
                    child: Text(
                      'Resend Code',
                      style: setTextStyle(
                        GoogleFonts.poppins,
                        16,
                        AppColors.babySky,
                        FontWeight.w600,
                      ),
                    ),
                  );
                } else {
                  return Text(
                    'Resend code in 0:${controller.countdown.value.toString().padLeft(2, '0')}',
                    style: setTextStyle(
                      GoogleFonts.poppins,
                      16,
                      AppColors.pureWhite.withOpacity(0.6),
                      FontWeight.w500,
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
