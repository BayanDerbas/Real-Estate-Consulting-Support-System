import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/functions/validate_input.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/login_controller.dart';
import '../../../../core/constants/Fonts.dart';
import '../widgets/base_auth_screen.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final controller = Get.find<LoginController>();
    return BaseAuthScreen(
      componentHeight: height * 0.5,
      widget: Form(
        key: controller.formKey,
        child: Column(
          children: [
            CustomTextField(
              width: width * 0.8,
              hintText: "email",
              icon: Icons.email_outlined,
              controller: controller.email,
              validator: (val) {
                return validateInput(val!, 11, 50, 'email');
              },
            ).paddingOnly(left: 15, right: 15, top: 40),
            CustomTextField(
              width: width * 0.8,
              hintText: "password",
              icon: Icons.password,
              controller: controller.password,

              validator: (val) {
                return validateInput(val!, 8, 25, 'password');
              },
            ).paddingSymmetric(horizontal: 15),
            Text("Forgot password ?", style: Fonts.underlinedStyle)
                .onTap(() {
                  print('i love amona');
                })
                .align(alignment: Alignment.centerLeft)
                .paddingOnly(left: width * 0.05),
            Obx(() {
              return controller.isLoading.value
                  ? const CircularProgressIndicator().paddingOnly(top: 30)
                  : CustomButton(
                    text: 'Login',
                    textColor: AppColors.pureWhite,
                    backgroundColor: AppColors.deepNavy,
                    borderRadius: 10,
                    width: width * 0.8,
                    onPressed: () async {
                      final SecureStorage st = SecureStorage();

                      print('hello i\'m a programmer not Engineer 😥');
                      print(await st.getToken());
                      bool isValidInput = controller.validateInput();
                      if (isValidInput)
                        controller.userLogin();
                      else {
                        return;
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
      footerText: '',
      // "By clicking login you agree to Tradinos Terms & Conditions. Capital at risk: Before any thing, Please read the Key Risks.",
      onTap: () {
        Get.toNamed(AppRoutes.signup);
      },
    );
  }
}
