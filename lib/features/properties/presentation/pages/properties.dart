import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
import 'package:graduation_project/core/widgets/Custom_IconButton.dart';
import 'package:graduation_project/features/properties/presentation/controllers/Properties_Controller.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/widgets/Custom_PaginationBar.dart';
import '../../data/repository/property_repository.dart';

class Properties extends StatelessWidget {
  const Properties({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      PropertiesController(Get.find<PropertyRepository>()),
    );
    return Obx(() {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: CustomAppbar(
            text: "Properties",
            icon: Icon(Icons.notifications),
            iconColor: AppColors.pureWhite,
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: AppColors.darkGray,
                        size: 30,
                      ),
                      SizedBox(width: 3),
                      Text(
                        "200 +",
                        style: Fonts.itim.copyWith(
                          color: AppColors.darkGray,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "available properties",
                    style: Fonts.itim.copyWith(
                      color: AppColors.grey,
                      fontSize: 18,
                    ),
                  ).padding(EdgeInsets.only(bottom: 5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                        icon: Icons.house_sharp,
                        label: "Home",
                        isSelected: controller.selectedIndex.value == 0,
                        onTap: () => controller.setSelectedIndex(0),
                      ),
                      CustomIconButton(
                        icon: Icons.apartment,
                        label: "Apartment",
                        isSelected: controller.selectedIndex.value == 1,
                        onTap: () => controller.setSelectedIndex(1),
                      ),
                      CustomIconButton(
                        icon: Icons.store,
                        label: "Store",
                        isSelected: controller.selectedIndex.value == 2,
                        onTap: () => controller.setSelectedIndex(2),
                      ),
                      CustomIconButton(
                        icon: Icons.villa,
                        label: "UPPER_FLOOR",
                        isSelected: controller.selectedIndex.value == 3,
                        onTap: () => controller.setSelectedIndex(3),
                      ),
                    ],
                  ).scrollDirection(Axis.horizontal),
                  controller.isLoading.value
                      ? Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Center(child: CircularProgressIndicator()),
                      )
                      : controller.properties.isEmpty
                      ? Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(height: 200),
                            Text(
                              controller.failureMessage.value.isNotEmpty
                                  ? controller.failureMessage.value
                                  : "No properties available.",
                              style: Fonts.itim.copyWith(
                                fontSize: 16,
                                color: AppColors.deepNavy,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                      : Column(
                        children:
                            controller.propertiesList
                                .map((property) => property)
                                .toList(),
                      ).padding(EdgeInsets.only(top: 5)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomPaginationBar(
                        totalPages: controller.totalPages.value,
                        currentPage: controller.currentPage.value,
                        onPageSelected: (page) => controller.goToPage(page),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
