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
import '../widgets/Custom_Properties.dart';

class Properties extends StatelessWidget {
  const Properties({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      PropertiesController(Get.find<PropertyRepository>()),
    );

    final Map<String, String> propertyTypes = {
      'HOME': 'Home',
      'APARTMENT': 'Apartment',
      'VILLA': 'Villa',
      'LAND': 'Land',
      'STORE': 'Store',
      'OFFICE': 'Office',
      'OTHER': 'Other',
    };

    return Obx(() {
      final groupedProperties = <String, List<CustomProperties>>{};
      for (var property in controller.propertiesList) {
        final type = property.propertyType;
        if (!groupedProperties.containsKey(type)) {
          groupedProperties[type] = [];
        }
        groupedProperties[type]!.add(property);
      }

      final displayTypes = controller.selectedIndex.value == -1
          ? propertyTypes.entries
          : [
        propertyTypes.entries
            .toList()[controller.selectedIndex.value]
      ];

      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: CustomAppbar(
            text: "Properties",
            icon: Icons.notifications,
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
                        "${controller.allProperties.length} +",
                        style: Fonts.itim.copyWith(
                          color: AppColors.darkGray,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Available Properties",
                    style: Fonts.itim.copyWith(
                      color: AppColors.grey,
                      fontSize: 18,
                    ),
                  ).padding(EdgeInsets.only(bottom: 5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                        icon: Icons.dashboard_customize,
                        label: "All",
                        isSelected: controller.selectedIndex.value == -1,
                        onTap: () => controller.setSelectedIndex(-1),
                      ),
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
                        icon: Icons.villa,
                        label: "Villa",
                        isSelected: controller.selectedIndex.value == 2,
                        onTap: () => controller.setSelectedIndex(2),
                      ),
                      CustomIconButton(
                        icon: Icons.landscape,
                        label: "Land",
                        isSelected: controller.selectedIndex.value == 3,
                        onTap: () => controller.setSelectedIndex(3),
                      ),
                      CustomIconButton(
                        icon: Icons.store,
                        label: "Store",
                        isSelected: controller.selectedIndex.value == 4,
                        onTap: () => controller.setSelectedIndex(4),
                      ),
                      CustomIconButton(
                        icon: Icons.business,
                        label: "Office",
                        isSelected: controller.selectedIndex.value == 5,
                        onTap: () => controller.setSelectedIndex(5),
                      ),
                      CustomIconButton(
                        icon: Icons.category,
                        label: "Other",
                        isSelected: controller.selectedIndex.value == 6,
                        onTap: () => controller.setSelectedIndex(6),
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
                    children: displayTypes.map((entry) {
                      final type = entry.key;
                      final label = entry.value;
                      final propertiesForType = groupedProperties[type] ?? [];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Text(
                              label,
                              style: Fonts.itim.copyWith(
                                color: AppColors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          propertiesForType.isEmpty
                              ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16),
                            child: Text(
                              "No $label available.",
                              style: Fonts.itim.copyWith(
                                color: AppColors.grey,
                                fontSize: 16,
                              ),
                            ),
                          )
                              : Column(
                            children: propertiesForType
                                .map((property) => property)
                                .toList(),
                          ).padding(EdgeInsets.only(bottom: 10)),
                        ],
                      );
                    }).toList(),
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