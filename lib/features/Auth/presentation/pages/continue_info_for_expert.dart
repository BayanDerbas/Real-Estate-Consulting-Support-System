import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/features/Auth/presentation/widgets/custom_drop_down_with_field.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constants/styles.dart';
import '../controllers/signup_controller.dart';
import '../widgets/base_auth_screen.dart';
import '../widgets/custom_text_form_field.dart';

class ContinueInfoForExpert extends StatelessWidget {
  const ContinueInfoForExpert({super.key});

  void _showImageSourceDialog(BuildContext context, Rx<File?> fileTarget) {
    showModalBottomSheet(
      context: context,
      builder:
          (_) => SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Take Photo'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.find<RegisterController>().pickImage(
                      ImageSource.camera,
                      fileTarget,
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Choose from Gallery'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.find<RegisterController>().pickImage(
                      ImageSource.gallery,
                      fileTarget,
                    );
                  },
                ),
              ],
            ),
          ),
    );
  }

  Widget _imageUploadTile(BuildContext context, Rx<File?> imageFileRx) {
    return GestureDetector(
      onTap: () => _showImageSourceDialog(context, imageFileRx),
      child: Obx(() {
        final imageFile = imageFileRx.value;
        return Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.pureWhite.withOpacity(0.4),
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child:
              imageFile != null
                  ? Image.file(imageFile, fit: BoxFit.cover)
                  : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tap to upload image",
                          style: setTextStyle(
                            GoogleFonts.itim,
                            18,
                            AppColors.black,
                            FontWeight.normal,
                          ),
                        ),
                        Icon(
                          Icons.cloud_upload,
                          color: AppColors.deepNavy,
                          size: 50,
                        ),
                      ],
                    ),
                  ),
        ).paddingAll(10);
      }),
    ).paddingOnly(bottom: 20);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final controller = Get.find<RegisterController>();

    return BaseAuthScreen(
      widget: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              if (controller.selectedRole.value == 'OFFICE') ...[
                const Text("Commercial Register Image"),
                const SizedBox(height: 10),
                _imageUploadTile(context, controller.commercialRegisterImage),
              ],
              if (controller.selectedRole.value == 'EXPERT') ...[
                const Text("ID Card Image"),
                const SizedBox(height: 10),
                _imageUploadTile(context, controller.idCardImage),
                const Text("Degree Certificate Image"),
                const SizedBox(height: 10),
                _imageUploadTile(context, controller.degreeCertificateImage),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  width: width * 0.8,
                  hintText: "Profession",
                  icon: Icons.work_outline,
                  controller: controller.profession,
                ).paddingSymmetric(horizontal: 15),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  width: width * 0.8,
                  hintText: "Experience",
                  icon: Icons.school,
                  controller: controller.experience,
                ).paddingSymmetric(horizontal: 15),
              ],
              if (controller.selectedRole.value != 'USER') ...[
                CustomTextField(
                  keyboardType: TextInputType.text,
                  width: width * 0.8,
                  hintText: "Location",
                  icon: Icons.location_on_outlined,
                  controller: controller.location,
                ).paddingSymmetric(horizontal: 15),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  width: width * 0.8,
                  hintText: "Bio",
                  icon: Icons.info_outline,
                  controller: controller.bio,
                ).paddingSymmetric(horizontal: 15),
              ],
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  ).paddingOnly(top: 20);
                }
                return CustomButton(
                  text: 'register',
                  textColor: AppColors.pureWhite,
                  backgroundColor: AppColors.deepNavy,
                  borderRadius: 10,
                  width: width * 0.8,
                  onPressed: controller.userRegister,
                ).paddingOnly(top: 10);
              }),
            ],
          ),
        ),
      ),
      appBarTitle: "Complete Your Profile",
      bodyText: "Have an account?",
      clickableText: "Sign in",
      footerText:
          "By clicking register you agree to Tradinos Terms & Conditions.",
      onTap: () => Get.toNamed(AppRoutes.login),
    );
  }
}
