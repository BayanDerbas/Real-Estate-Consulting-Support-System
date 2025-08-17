import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/features/posts/presentation/widgets/base_post_screen.dart';
import 'package:graduation_project/features/posts/presentation/widgets/custom_post_text_feild.dart';
import '../controllers/create_post_controller.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreatePostController(Get.find()));

    return Scaffold(
      body: BasePostScreen(
        heightOfAppBar: 120,
        appBarTitle: 'create post'.tr,
        child: Obx(() {
          return Stack(
            children: [
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:
                          controller.imageFile.value != null
                              ? Image.file(
                                controller.imageFile.value!,
                                fit: BoxFit.cover,
                              )
                              : const Center(
                                child: Icon(
                                  Icons.add_a_photo_outlined,
                                  size: 100,
                                ),
                              ),
                    ).onTap(() => controller.pickImage()).paddingAll(10),

                    CustomPostTextFeild(
                      controller: controller.content,
                      label: 'content'.tr,
                      maxLines: 4,
                    ).paddingAll(10),

                    const SizedBox(height: 16),
                    CustomButton(
                      onPressed: () => controller.createPost(),
                      text: 'Post'.tr,
                      backgroundColor: AppColors.deepNavy,
                      textColor: AppColors.pureWhite,
                      width: 100,
                    ),
                  ],
                ),
              ),
              if (controller.isLoading.value)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        }),
      ),
    );
  }
}
