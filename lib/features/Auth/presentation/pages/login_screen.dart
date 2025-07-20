import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/functions/validate_input.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/login_controller.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import 'package:graduation_project/features/Auth/presentation/widgets/base_auth_screen.dart';
import 'package:graduation_project/features/Auth/presentation/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    final controller = Get.find<LoginController>();

    return BaseAuthScreen(
      componentHeight: currentHeight * 0.5,
      widget: Form(
        key: controller.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              width: width * 0.8,
              hintText: "email",
              icon: Icons.email_outlined,
              controller: controller.email,
              validator: (val) => validateInput(val!, 11, 50, 'email'),
            ).paddingOnly(left: 15, right: 15, top: 40),
            CustomTextField(
              width: width * 0.8,
              hintText: "password",
              icon: Icons.lock_outline,
              controller: controller.password,
              validator: (val) => validateInput(val!, 8, 25, 'password'),
            ).paddingSymmetric(horizontal: 15),
            Text("Forgot password?", style: Fonts.underlinedStyle)
                .onTap(() => Get.toNamed(AppRoutes.forgotPassword))
                .align(alignment: Alignment.centerLeft)
                .paddingOnly(left: width * 0.05, top: 10),
            Obx(() {
              return controller.isLoading.value
                  ? const Center(
                    child: CircularProgressIndicator(),
                  ).paddingOnly(top: 30)
                  : CustomButton(
                    text: 'Login',
                    textColor: AppColors.pureWhite,
                    backgroundColor: AppColors.deepNavy,
                    borderRadius: 10,
                    width: width * 0.8,
                    onPressed: () {
                      if (controller.validateInput()) {
                        controller.userLogin();
                      }
                    },
                  ).paddingOnly(top: 30);
            }),
          ],
        ),
      ),
      appBarTitle: "Welcome Back",
      bodyText: "Don't have an account?",
      clickableText: "Sign Up",
      onTap: () => Get.toNamed(AppRoutes.signup),
    );
  }
}
