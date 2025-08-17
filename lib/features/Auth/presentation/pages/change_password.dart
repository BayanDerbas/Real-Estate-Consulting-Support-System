// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../../../core/constants/colors.dart';
// import '../../../../core/functions/validate_input.dart';
// import '../../../../core/routes/routes.dart';
// import '../../../../core/widgets/Custom_Button.dart';
// import '../controllers/change_password_controller.dart';
// import '../widgets/base_auth_screen.dart';
// import '../widgets/custom_text_form_field.dart';
//
// class ResetPassword extends StatelessWidget {
//   const ResetPassword({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     final controller = Get.find<ChangePasswordController>();
//
//     return BaseAuthScreen(
//       componentHeight: height * 0.6,
//       widget: Form(
//         key: controller.formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CustomTextField(
//               width: width * 0.8,
//               hintText: "Email",
//               icon: Icons.email,
//               controller: controller.email,
//               validator: (val) {
//                 return validateInput(val!, 5, 50, 'email');
//               },
//             ).paddingSymmetric(horizontal: 15),
//
//             CustomTextField(
//               width: width * 0.8,
//               hintText: "New password",
//               icon: Icons.password,
//               controller: controller.password,
//               validator: (val) {
//                 return validateInput(val!, 8, 25, 'password');
//               },
//             ).paddingSymmetric(horizontal: 15),
//
//             Obx(() {
//               return controller.isLoading.value
//                   ? const CircularProgressIndicator().paddingOnly(top: 30)
//                   : CustomButton(
//                     text: 'Change',
//                     textColor: AppColors.pureWhite,
//                     backgroundColor: AppColors.deepNavy,
//                     borderRadius: 10,
//                     width: width * 0.8,
//                     onPressed: () {
//                       if (controller.validateInput()) {
//                         print('///////////////////////////');
//                         print('${controller.email}');
//                         print('${controller.password}');
//                         controller.changePassword();
//                       }
//                     },
//                   ).paddingOnly(top: 30);
//             }),
//           ],
//         ),
//       ),
//       appBarTitle: "Reset Password",
//       bodyText: "",
//       clickableText: "",
//       footerText: '',
//       onTap: () {
//         Get.toNamed(AppRoutes.login);
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/functions/validate_input.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/Custom_Button.dart';
import '../controllers/change_password_controller.dart';
import '../widgets/base_auth_screen.dart';
import '../widgets/custom_text_form_field.dart';

class ResetPassword1 extends GetView<ChangePasswordController> {
  const ResetPassword1({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BaseAuthScreen(
      appBarTitle: "Reset Password",
      bodyText: "Create a new, strong password \n for your account.",
      componentHeight: height * 0.5,
      widget: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              width: width * 0.8,
              hintText: "New password",
              icon: Icons.lock_outline,

              maxLines: 1,
              controller: controller.password,
              validator: (val) {
                return validateInput(val!, 8, 25, 'password');
              },
            ).paddingSymmetric(horizontal: 15),

            const SizedBox(height: 30),

            Obx(() {
              return controller.isLoading.value
                  ? const CircularProgressIndicator(color: AppColors.deepNavy)
                  : CustomButton(
                    text: 'Reset Password',
                    textColor: AppColors.pureWhite,
                    backgroundColor: AppColors.deepNavy,
                    borderRadius: 10,
                    width: width * 0.8,
                    onPressed: () {
                      print('///////////////');
                      print(controller.userEmail);
                      controller.changePassword();
                    },
                  );
            }),
          ],
        ),
      ),
      footerText: '',
      clickableText: ' ',
      onTap: () {
        Get.offAllNamed(AppRoutes.login);
      },
    );
  }
}
