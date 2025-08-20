import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/functions/validate_input.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/keyboard_controller.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/signup_controller.dart';
import 'package:graduation_project/features/Auth/presentation/widgets/base_auth_screen.dart';
import 'package:graduation_project/features/Auth/presentation/widgets/custom_drop_down_with_field.dart';
import 'package:graduation_project/features/Auth/presentation/widgets/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    final controller = Get.find<RegisterController>();
    return BaseAuthScreen(
      widget: Form(
        key: controller.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              keyboardType: TextInputType.name,
              width: width * 0.8,
              hintText: "first name".tr,
              icon: Icons.person_outline,
              controller: controller.firstName,
              validator: (val) => validateInput(val!, 2, 30, 'username'),
            ).paddingOnly(left: 15, right: 15, top: 40),
            CustomTextField(
              keyboardType: TextInputType.name,
              width: width * 0.8,
              hintText: "last name".tr,
              icon: Icons.person_outline,
              controller: controller.lastName,
              validator: (val) => validateInput(val!, 2, 30, 'username'),
            ).paddingSymmetric(horizontal: 15),
            CustomTextField(
              keyboardType: TextInputType.emailAddress,
              width: width * 0.8,
              hintText: "email".tr,
              icon: Icons.email,
              controller: controller.email,
              validator: (val) => validateInput(val!, 2, 30, 'email'),
            ).paddingSymmetric(horizontal: 15),
            CustomTextField(
              keyboardType: TextInputType.visiblePassword,
              width: width * 0.8,
              hintText: "password".tr,
              icon: Icons.lock_outline,
              controller: controller.password,
              validator: (val) => validateInput(val!, 8, 30, 'password'),
            ).paddingSymmetric(horizontal: 15),
            CustomTextField(
              keyboardType: TextInputType.phone,
              width: width * 0.8,
              hintText: "phone".tr,
              icon: Icons.phone,
              controller: controller.phone,
              validator: (val) => validateInput(val!, 10, 10, 'phonenumber'),
            ).paddingSymmetric(horizontal: 15),
            CustomDropDownWithField(
              width: width * 0.8,
              list: controller.roles,
              item: controller.selectedRole,
              onChanged: controller.onChangeRole,
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                ).paddingOnly(top: 20);
              }
              final buttonText =
                  controller.selectedRole.value == 'USER'
                      ? 'register'.tr
                      : 'continue fill info'.tr;
              return CustomButton(
                text: buttonText,
                textColor: AppColors.pureWhite,
                backgroundColor: AppColors.deepNavy,
                borderRadius: 10,
                width: width * 0.8,
                onPressed: () {
                  final valid = controller.validateInput();
                  if (!valid) return;
                  controller.selectedRole.value == 'USER'
                      ? controller.userRegister()
                      : Get.toNamed(AppRoutes.continueFillExpertInfo);
                },
              ).paddingOnly(top: 10, bottom: 20);
            }),
          ],
        ),
      ),
      appBarTitle: "Create Account".tr,
      bodyText: "Have an account?".tr,
      clickableText: "Sign in".tr,
      footerText: "",
      onTap: () {
        Get.toNamed(AppRoutes.login);
      },
    );
  }
}
