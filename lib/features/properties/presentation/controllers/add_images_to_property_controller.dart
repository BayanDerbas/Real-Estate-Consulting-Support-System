import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/networks/failures.dart';
import '../../data/repository/property_repository.dart';
import '../../data/model/propertyImage_model.dart';

class AddImagesToPropertyController extends GetxController {
  final PropertyRepository _propertyRepository;

  final RxList<File> images = <File>[].obs;
  final Rx<File?> mainImage = Rx<File?>(null);
  final RxBool isUploading = false.obs;

  late final int propertyId;

  AddImagesToPropertyController(this._propertyRepository);

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is int) {
      propertyId = Get.arguments as int;
    } else {
      Get.snackbar("Error", "Property ID not found. Please go back.");
      if (Get.isDialogOpen!) Get.back();
    }
  }

  Future<void> pickMainImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      mainImage.value = File(picked.path);
    }
  }

  Future<void> pickSubImages() async {
    final picked = await ImagePicker().pickMultiImage();
    if (picked.isNotEmpty) {
      images.addAll(picked.map((x) => File(x.path)));
    }
  }

  Future<void> uploadImages() async {
    if (mainImage.value == null) {
      Get.snackbar("Error", "Please select a MAIN image first.");
      return;
    }

    isUploading.value = true;

    int successCount = 0;
    int failedCount = 0;

    final mainResult = await _propertyRepository.uploadPropertyImage(
      propertyId,
      "MAIN",
      mainImage.value!,
    );

    mainResult.fold(
      (failure) {
        failedCount++;

        Get.snackbar(
          "Upload Error",
          "The MAIN image failed to upload. Aborting.",
        );
        isUploading.value = false;
        return;
      },
      (_) {
        Get.snackbar(
          "Upload Success ",
          "The MAIN image has been uploaded",
          duration: Duration(seconds: 1),
        );
        successCount++;
      },
    );

    if (images.isEmpty) {
      isUploading.value = false;
      Get.snackbar(
        "Upload Complete",
        "MAIN image uploaded successfully!",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final List<Future<dynamic>> uploadFutures =
        images.map((img) {
          return _propertyRepository.uploadPropertyImage(
            propertyId,
            "SUB",
            img,
          );
        }).toList();

    final results = await Future.wait(uploadFutures);

    for (var result in results) {
      result.fold(
        (failure) {
          failedCount++;
        },
        (_) {
          Get.snackbar(
            "Upload Success ",
            "image ${successCount}has been uploaded successfully ",
            duration: Duration(seconds: 2),
          );
          successCount++;
        },
      );
    }

    isUploading.value = false;

    Get.snackbar(
      "Upload Complete",
      "$successCount images uploaded successfully, $failedCount failed.",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    );
    if (failedCount == 0) {
      await Future.delayed(Duration(seconds: 2));
      Get.offAllNamed(AppRoutes.home);
    }
  }
}
