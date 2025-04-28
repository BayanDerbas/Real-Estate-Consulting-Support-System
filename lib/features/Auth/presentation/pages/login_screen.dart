import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import '../../../../core/constants/Fonts.dart';
import '../widgets/base_auth_screen.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BaseAuthScreen(
      widget: Column(
        children: [
          CustomTextFormField(
            width: width * 0.8,
            hintText: "email",
            icon: Icons.email_outlined,
            controller: emailController,
          ).paddingOnly(left: 15, right: 15, top: 40),
          CustomTextFormField(
            width: width * 0.8,
            hintText: "password",
            icon: Icons.password,
            controller: passwordController,
          ).paddingSymmetric(horizontal: 15),
          Text("Forgot password ?", style: Fonts.underlinedStyle)
              .onTap(() {
                print('i love amona');
              })
              .align(alignment: Alignment.centerLeft)
              .paddingOnly(left: width * 0.05),
          CustomButton(
            text: 'login',
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
      appBarTitle: "Welcome Back",
      bodyText: "Don't have an account?",
      clickableText: "Sign Up",
      footerText:
          "By clicking login you agree to Tradinos Terms & Conditions. Capital at risk: Before any thing, Please read the Key Risks.",
      onTap: () {
        Get.toNamed(AppRoutes.signup);
      },
    );
  }
}
