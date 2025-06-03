import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/verification_code_controller.dart';

import '../../../../core/widgets/custom_otp.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VerificationCodeController>();
    return Scaffold(
      body: Center(
        child: OTPInput(
          onCompleted: (code) {
            controller.code.text = code;
            controller.verificationCode();
            print(code);
            print(controller.code.text);
          },
        ),
      ),
    );
  }
}
