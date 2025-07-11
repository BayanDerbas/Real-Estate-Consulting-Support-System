import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/features/properties/data/model/property_model.dart';
import '../controllers/PropertyDetails_Controller.dart';
import '../widgets/Custom_PropertyDetails.dart';

class PropertyDetails extends StatelessWidget {

  const PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final propertyDetailsController controller = Get.put(propertyDetailsController());
    final PropertyModel property = Get.arguments as PropertyModel;
    final List<String> imageList = property.propertyImageList
        .map((imageModel) => imageModel.imageUrl)
        .toList();
    return Scaffold(
      body: Obx(() => CustomPropertyDetails(
        imagePath: imageList.isNotEmpty ? imageList[0] : AppImages.noImage,
        images: imageList.length > 1 ? imageList.sublist(1) : [],
        price: property.price.toString(),
        title: property.houseType,
        location: property.location,
        area: property.area.toString(),
        beds: property.numberOfBed.toString(),
        baths: property.numberOfBathrooms.toString(),
        details: property.description,
        selectedIndex: controller.selectedImageIndex.value,
        onImageTap: (index) => controller.changeImage(index),
        onSwipe: (details) {
          if (details.primaryVelocity! < 0) {
            controller.nextImage(imageList.length);
          } else if (details.primaryVelocity! > 0) {
            controller.previousImage(imageList.length);
          }
        },
      ),
      ).scrollDirection(Axis.vertical),
    );
  }
}