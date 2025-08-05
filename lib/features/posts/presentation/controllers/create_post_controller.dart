import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/posts/data/model/create_post_request_model.dart';
import 'package:graduation_project/features/posts/data/repository/posts_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:graduation_project/core/routes/routes.dart';

class CreatePostController extends GetxController {
  final PostsRepository _postsRepository;
  CreatePostController(this._postsRepository);

  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final imageFile = Rx<File?>(null);

  final formKey = GlobalKey<FormState>();
  final content = TextEditingController();

  final picker = ImagePicker();
  final storage = SecureStorage();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  Future<void> createPost() async {
    final userId = await storage.getUserId();
    if (userId == null) {
      errorMessage.value = "User ID not found";
      return;
    }

    if (!validateInput() || imageFile.value == null) {
      errorMessage.value = "Please fill all fields and select an image.";
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    final request = CreatePostRequestModel(
      expertId: int.parse(userId),
      content: content.text,
      image: imageFile.value,
    );

    final context = Get.context;
    if (context == null) return;

    final result = await _postsRepository.addPost(request);
    isLoading.value = false;

    result.fold(
      (failure) {
        errorMessage.value = failure.err_message;
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: "Post Creation Failed",
          desc: errorMessage.value,
          btnOkOnPress: () {},
        ).show();
      },
      (response) async {
        await AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          title: "Success",
          desc: "Post created successfully",
          autoHide: const Duration(seconds: 2),
        ).show();

        Get.offNamed(AppRoutes.home);
      },
    );
  }

  bool validateInput() {
    final formData = formKey.currentState;
    return formData?.validate() ?? false;
  }

  @override
  void onClose() {
    content.dispose();
    super.onClose();
  }
}
