import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/features/Auth/presentation/widgets/custom_drop_down_with_field.dart';
import '../../../../core/functions/validate_input.dart';
import '../controllers/signup_controller.dart';
import '../widgets/base_auth_screen.dart';
import '../widgets/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final controller = Get.find<RegisterController>();
    return BaseAuthScreen(
      widget: Form(
        key: controller.formKey,
        child: Column(
          children: [
            CustomTextFormField(
              keyboardType: TextInputType.name,
              width: width * 0.8,
              hintText: "first name",
              icon: Icons.email_outlined,
              controller: controller.firstName,
              validator: (val) {
                return validateInput(val!, 2, 30, 'username');
              },
            ).paddingOnly(left: 15, right: 15, top: 40),
            CustomTextFormField(
              keyboardType: TextInputType.name,
              width: width * 0.8,
              hintText: "last name",
              icon: Icons.password,
              controller: controller.lastName,
              validator: (val) {
                return validateInput(val!, 2, 30, 'username');
              },
            ).paddingSymmetric(horizontal: 15),
            CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              width: width * 0.8,
              hintText: "email",
              icon: Icons.email,
              controller: controller.email,
              validator: (val) {
                return validateInput(val!, 2, 30, 'email');
              },
            ).paddingSymmetric(horizontal: 15),
            CustomTextFormField(
              keyboardType: TextInputType.name,
              width: width * 0.8,
              hintText: "password",
              icon: Icons.password,
              controller: controller.password,
              validator: (val) {
                return validateInput(val!, 2, 30, 'password');
              },
            ).paddingSymmetric(horizontal: 15),
            CustomTextFormField(
              keyboardType: TextInputType.phone,
              width: width * 0.8,
              hintText: "phone",
              icon: Icons.phone,
              controller: controller.phone,
              validator: (val) {
                return validateInput(val!, 10, 10, 'phonenumber');
              },
            ).paddingSymmetric(horizontal: 15),
            CustomDropDownWithField(
              width: width * 0.8,
              list: controller.roles,
              item: controller.selectedRole,
              onChanged: (newVal) {
                controller.onChangeRole(newVal);
              },
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                ).paddingOnly(top: 20);
              }

              return controller.selectedRole.value == 'USER'
                  ? CustomButton(
                    text: 'register',
                    textColor: AppColors.pureWhite,
                    backgroundColor: AppColors.deepNavy,
                    borderRadius: 10,
                    width: width * 0.8,
                    onPressed: () {
                      bool isValidInput = controller.validateInput();
                      isValidInput ? controller.userRegister() : false;
                    },
                  ).paddingOnly(top: 10)
                  : CustomButton(
                    text: 'continue fill info',
                    textColor: AppColors.pureWhite,
                    backgroundColor: AppColors.deepNavy,
                    borderRadius: 10,
                    width: width * 0.8,
                    onPressed: () {
                      bool isValidInput = controller.validateInput();
                      isValidInput
                          ? Get.toNamed(AppRoutes.continueFillExpertInfo)
                          : false;
                    },
                  ).paddingOnly(top: 10);
            }),
          ],
        ).scrollDirection(Axis.vertical),
      ),
      appBarTitle: "Welcome Back",
      bodyText: " have an account?",
      clickableText: "Sign in",
      footerText:
          "By clicking login you agree to Tradinos Terms & Conditions. Capital at risk: Before any thing, Please read the Key Risks.",
      onTap: () {
        Get.toNamed(AppRoutes.login);
      },
    );
  }
}
