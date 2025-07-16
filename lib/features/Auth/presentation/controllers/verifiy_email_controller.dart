import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/send_code_controller.dart';
import '../../../../core/routes/routes.dart';

class VerifyEmailController extends GetxController {
  final SendCodeController sendCodeController;
  VerifyEmailController(this.sendCodeController);

  var isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  Future<void> sendCodeAndNavigate() async {
    if (!formKey.currentState!.validate()) return;

    isLoading(true);
    await sendCodeController.sendCode(emailController.text);
    isLoading(false);

    Get.toNamed(
      AppRoutes.verificationCode,
      arguments: {
        'email': emailController.text,
        'nextRoute': AppRoutes.resetPassword,
      },
    );
  }
}
