import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
import 'package:graduation_project/core/widgets/Custom_IconButton.dart';
import 'package:graduation_project/features/properties/presentation/controllers/Properties_Controller.dart';
import '../../../../core/constants/Fonts.dart';

class Properties extends StatelessWidget {
  const Properties({super.key});

  @override
  Widget build(BuildContext context) {
    final PropertiesController controller = Get.put(PropertiesController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: CustomAppbar(
          text: "Properties",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home_outlined, color: AppColors.darkGray, size: 30),
              SizedBox(width: 3),
              Text(
                "200+",
                style: Fonts.itim.copyWith(
                  color: AppColors.darkGray,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Text(
            "available properties",
            style: Fonts.itim.copyWith(color: AppColors.grey, fontSize: 18),
          ).padding(EdgeInsets.only(bottom: 5)),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                  icon: Icons.house_sharp,
                  label: "Home",
                  isSelected: controller.SelectedIndex.value == 0,
                  onTap: () => controller.selectedIndex(0),
                ),
                CustomIconButton(
                  icon: Icons.apartment,
                  label: "apartment",
                  isSelected: controller.SelectedIndex.value == 1,
                  onTap: () => controller.selectedIndex(1),
                ),
                CustomIconButton(
                  icon: Icons.store,
                  label: "store",
                  isSelected: controller.SelectedIndex.value == 2,
                  onTap: () => controller.selectedIndex(2),
                ),
              ],
            );
          }),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: controller.propertiesList,
          ).padding(EdgeInsets.only(top: 5)),
        ],
      ).scrollDirection(Axis.vertical),
    );
  }
}
