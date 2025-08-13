import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/features/properties/data/model/property_model.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/PropertyDetails_Controller.dart';
import '../widgets/Custom_PropertyDetails.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final propertyDetailsController controller = Get.put(
      propertyDetailsController(),
    );
    final PropertyModel property = Get.arguments as PropertyModel;
    final List<String>? imageList =
        property.propertyImageList
            ?.map((imageModel) => imageModel.imageUrl)
            .toList();
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            CustomPropertyDetails(
              imagePath:
                  imageList!.isNotEmpty ? imageList[0] : AppImages.noImage,
              images: imageList.length > 1 ? imageList.sublist(1) : [],
              price: property.price.toString(),
              priceInMonth: property.priceInMonth.toString(),
              title: property.houseType!,
              location: property.location!,
              serviceType: property.serviceType!,
              area: property.area.toString(),
              room: property.numberOfRooms.toString(),
              beds: property.numberOfBed.toString(),
              baths: property.numberOfBathrooms.toString(),
              details: property.description!,
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
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CustomButton(
                text: "الذهاب للعقار",
                backgroundColor: AppColors.deepNavy,
                textColor: AppColors.pureWhite,
                width: 150,
                onPressed: () {
                  if (property.office!.id != null) {
                    Get.toNamed(
                      '/serviceProvider_profile',
                      arguments: {'id': property.office!.id, 'role': 'OFFICE'},
                    );
                  } else {
                    Get.snackbar("خطأ", "لا يوجد مكتب مرتبط بهذا العقار.");
                  }
                },
              ),
            ),
          ],
        ),
      ).scrollDirection(Axis.vertical),
    );
  }
}
