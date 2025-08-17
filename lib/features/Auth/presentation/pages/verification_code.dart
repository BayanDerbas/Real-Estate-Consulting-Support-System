import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/styles.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
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
                'Verification Code'.tr,
                textAlign: TextAlign.center,
                style: setTextStyle(
                  GoogleFonts.michroma,
                  25,
                  AppColors.pureWhite,
                  FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Please enter the verification code we sent to your email address'
                    .tr,
                textAlign: TextAlign.center,
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
                textAlign: TextAlign.center,
                style: setTextStyle(
                  GoogleFonts.poppins,
                  16,
                  AppColors.pureWhite,
                  FontWeight.bold,
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
                return controller.errMessage.value.isNotEmpty
                    ? Text(
                      controller.errMessage.value,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                      textAlign: TextAlign.center,
                    )
                    : const SizedBox.shrink();
              }),
              const SizedBox(height: 20),
              Obx(() {
                return controller.canResend.value
                    ? CustomButton(
                      text: 'Resend Code'.tr,
                      backgroundColor: AppColors.deepNavy,
                      textColor: AppColors.pureWhite,
                      width: 150,
                      onPressed: controller.sendCode,
                    )
                    : Text(
                      '${"Resend code in".tr} 0:${controller.countdown.value.toString().padLeft(2, '0')}',
                      style: setTextStyle(
                        GoogleFonts.poppins,
                        16,
                        AppColors.pureWhite.withOpacity(0.6),
                        FontWeight.w500,
                      ),
                    );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
