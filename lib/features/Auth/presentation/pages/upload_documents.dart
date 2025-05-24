import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/upload_documents_controller.dart';
import '../../../../core/routes/routes.dart';
import '../widgets/base_auth_screen.dart';
import '../widgets/custom_drop_down_with_field.dart';
import '../widgets/custom_text_form_field.dart';

class UploadDocuments extends StatelessWidget {
  const UploadDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    UploadDocumentsController controller = Get.put(UploadDocumentsController());
    return BaseAuthScreen(
      widget: Column(
        children: [
          CustomDropDownWithField(
            width: width * 0.8,
            list: controller.types,
            item: controller.selectType,
            onChanged: (String? value) {
              controller.onChangeType(value);
            },
          ).paddingOnly(top: 100),
          CustomTextFormField(
            width: width * 0.8,
            hintText: "attach documents",
            icon: Icons.password,
            controller: controller.attachDocuments,
          ).paddingSymmetric(horizontal: 15),
          Spacer(),
          CustomButton(
                text: 'Next',
                textColor: AppColors.pureWhite,
                backgroundColor: AppColors.deepNavy,
                borderRadius: 10,
                width: width * 0.3,
                onPressed: () {},
              )
              .paddingOnly(top: 30, bottom: 15, right: width * 0.05)
              .align(alignment: Alignment.bottomRight),
        ],
      ),
      appBarTitle: "Welcome Back",
      bodyText: "Don't have an account?",
      clickableText: "Sign Up",
      footerText: 'OR \n sign in with : ',
      onTap: () {
        Get.toNamed(AppRoutes.signup);
      },
    );
  }
}
