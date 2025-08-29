import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:graduation_project/features/profiles/data/repository/profile_repository.dart';
import '../../../../core/utils/secure_storage.dart';
import '../../data/model/expert_profile_model.dart';

class ExpertProfileController extends GetxController {
  final ProfileRepository profileRepository;
  final SecureStorage secureStorage = SecureStorage();

  ExpertProfileController({required this.profileRepository});

  var expertProfile = Rxn<ExpertProfileModel>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var isUploadingImage = false.obs;

  Future<void> fetchExpertByRole() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      expertProfile.value = null;

      final String? id = await secureStorage.getIdByRole();
      if (id == null) {
        errorMessage.value = "No expert id found in storage";
        return;
      }

      final Either<String, ExpertProfileModel> result = await profileRepository
          .getExpert(id: int.parse(id));

      result.fold(
        (failure) => errorMessage.value = failure,
        (data) => expertProfile.value = data,
      );
    } catch (e) {
      errorMessage.value = "Unexpected error: $e";
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickAndUploadUserImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile == null) return;

    final file = File(pickedFile.path);

    try {
      isUploadingImage.value = true;

      final Either<String, Unit> result = await profileRepository
          .uploadUserImage(file);

      result.fold(
        (failure) {
          print('.......................failure$failure');
          Get.snackbar(
            "Error",
            failure,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        },
        (_) async {
          Get.snackbar(
            "Success",
            "Profile picture updated!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          await fetchExpertByRole();
        },
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Unexpected error: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isUploadingImage.value = false;
    }
  }
}
