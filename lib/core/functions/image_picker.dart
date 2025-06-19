import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../features/Auth/presentation/controllers/signup_controller.dart';

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
                onTap: () {},
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
