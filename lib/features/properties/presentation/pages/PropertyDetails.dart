import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../controllers/PropertyDetails_Controller.dart';
import '../widgets/Custom_PropertyDetails.dart';

class PropertyDetails extends StatelessWidget {
  PropertyDetails({super.key});

  final propertyDetailsController controller = Get.put(propertyDetailsController());

  final List<String> imageList = [
    'assets/images/villa.jpg',
    'assets/images/balcony.jpg',
    'assets/images/bedroom.jpg',
    'assets/images/livingroom.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => CustomPropertyDetails(
        imagePath: imageList[0],
        images: imageList.sublist(1),
        price: '1200',
        title: 'Villa',
        location: 'New Cairo',
        area: '200m²',
        beds: '3',
        baths: '2',
        details: 'Spacious villa with garden and pool...',
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