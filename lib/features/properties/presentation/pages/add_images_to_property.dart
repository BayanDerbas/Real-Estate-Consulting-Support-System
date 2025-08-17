import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/features/properties/presentation/controllers/add_images_to_property_controller.dart';
import '../../../../core/constants/Fonts.dart';

class AddImagesToPropertyScreen extends StatelessWidget {
  const AddImagesToPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddImagesToPropertyController>();
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("add_images".tr, style: Fonts.itim),
        centerTitle: true,
        backgroundColor: AppColors.deepNavy,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("main_image".tr, style: Fonts.itim),
            const SizedBox(height: 10),
            Center(
              child: Obx(() {
                final mainImageFile = controller.mainImage.value;
                return GestureDetector(
                  onTap: () => controller.pickMainImage(),
                  child: Container(
                    height: 150,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColors.deepNavy, width: 2),
                      image:
                          mainImageFile != null
                              ? DecorationImage(
                                image: FileImage(mainImageFile),
                                fit: BoxFit.cover,
                              )
                              : null,
                    ),
                    child:
                        mainImageFile == null
                            ? const Icon(
                              Icons.add_a_photo,
                              size: 50,
                              color: AppColors.deepNavy,
                            )
                            : null,
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Text("other_images".tr, style: Fonts.itim),
            const SizedBox(height: 10),
            Obx(
              () => GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: controller.images.length + 1,
                itemBuilder: (context, index) {
                  if (index == controller.images.length) {
                    return GestureDetector(
                      onTap: () => controller.pickSubImages(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.deepNavy,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.add_a_photo,
                          size: 40,
                          color: AppColors.deepNavy,
                        ),
                      ),
                    );
                  }
                  final imageFile = controller.images[index];
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: FileImage(imageFile),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: () => controller.images.removeAt(index),
                          child: const Icon(Icons.cancel, color: Colors.red),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Obx(
              () => Center(
                child:
                    controller.isUploading.value
                        ? const CircularProgressIndicator()
                        : CustomButton(
                          text: "upload_images".tr,
                          backgroundColor: AppColors.deepNavy,
                          textColor: AppColors.pureWhite,
                          width: width * 0.6,
                          onPressed:
                              controller.mainImage.value != null
                                  ? () => controller.uploadImages()
                                  : null,
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
