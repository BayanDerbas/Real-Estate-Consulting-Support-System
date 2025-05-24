import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import '../controllers/signup_controller.dart';
import '../widgets/base_auth_screen.dart';
import '../widgets/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    SignupController controller = Get.put(SignupController());
    return BaseAuthScreen(
      widget: Column(
        children: [
          CustomTextFormField(
            width: width * 0.8,
            hintText: "name",
            icon: Icons.person,
            controller: controller.name,
          ).paddingOnly(left: 15, right: 15, top: 20),
          CustomTextFormField(
            width: width * 0.8,
            hintText: "email",
            icon: Icons.email_outlined,
            controller: controller.email,
          ).paddingOnly(left: 15, right: 15),
          CustomTextFormField(
            width: width * 0.8,
            hintText: "password",
            icon: Icons.password,
            controller: controller.password,
          ).paddingSymmetric(horizontal: 15),
          CustomTextFormField(
            width: width * 0.8,
            hintText: "phone",
            icon: Icons.phone,
            controller: controller.phone,
          ).paddingSymmetric(horizontal: 15),

          CustomButton(
            text: 'Signup',
            textColor: AppColors.pureWhite,
            backgroundColor: AppColors.deepNavy,
            borderRadius: 10,
            width: width * 0.8,
            onPressed: () {
              print('Login button pressed');
            },
          ).paddingOnly(top: 30),
        ],
      ),
      appBarTitle: "Register user",
      bodyText: "already have an account ?!",
      clickableText: "Login",
      footerText: 'OR \n sign in with : ',
      onTap: () {
        print('Sign up tapped');
        Get.toNamed(AppRoutes.login);
      },
    );
  }
}
