import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/functions/validate_input.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/change_password_controller.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/login_controller.dart';
import '../../../../core/constants/Fonts.dart';
import '../widgets/base_auth_screen.dart';
import '../widgets/custom_text_form_field.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final controller = Get.find<ChangePasswordController>();
    return BaseAuthScreen(
      componentHeight: height * 0.5,
      widget: Form(
        key: controller.formKey,
        child: Column(
          children: [
            CustomTextFormField(
              width: width * 0.8,
              hintText: "email",
              icon: Icons.email_outlined,
              controller: controller.email,
              validator: (val) {
                return validateInput(val!, 11, 50, 'email');
              },
            ).paddingOnly(left: 15, right: 15, top: 40),
            CustomTextFormField(
              width: width * 0.8,
              hintText: "password",
              icon: Icons.password,
              controller: controller.password,

              validator: (val) {
                return validateInput(val!, 8, 25, 'password');
              },
            ).paddingSymmetric(horizontal: 15),

            Obx(() {
              return controller.isLoading.value
                  ? const CircularProgressIndicator().paddingOnly(top: 30)
                  : CustomButton(
                    text: 'Change',

                    textColor: AppColors.pureWhite,
                    backgroundColor: AppColors.deepNavy,
                    borderRadius: 10,
                    width: width * 0.8,
                    onPressed: () {
                      bool isValidInput = controller.validateInput();
                      if (isValidInput) {
                        controller.changePassword();
                      } else {
                        return;
                      }
                    },
                  ).paddingOnly(top: 30);
            }),
          ],
        ),
      ),
      appBarTitle: "Welcome Back",
      bodyText: " ",
      clickableText: " ",
      footerText: ' ',
      onTap: () {
        Get.toNamed(AppRoutes.home);
      },
    );
  }
}
