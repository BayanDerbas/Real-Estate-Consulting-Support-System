import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/Custom_Appbar.dart';
import '../../../home/presentation/widgets/Custom_BottomBar.dart';
import '../controllers/settings_controller.dart';
import '../widgets/CustomSettingsItem.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.put(SettingsController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: 'Settings'.tr,
          textStyle: Get.locale?.languageCode == 'ar'
              ? Fonts.taj.copyWith(color: AppColors.pureWhite, fontSize: 22)
              : Fonts.itim.copyWith(color: AppColors.pureWhite, fontSize: 22),
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Obx(() {
        return ListView(
          children: [
            CustomSettingsItem(
              title: 'Change Password',
              icon: Icons.local_offer,
              isArabic: Get.locale?.languageCode == 'ar',
              onTap: () {
                Get.toNamed(AppRoutes.create_discounts);
              },
            ),
            if (controller.isExpert || controller.isOffice)
              CustomSettingsItem(
                title: 'Create Coupons'.tr,
                icon: Icons.local_offer,
                isArabic: Get.locale?.languageCode == 'ar',
                onTap: () {
                  Get.toNamed(AppRoutes.create_discounts);
                },
              ),
            if (controller.isExpert)
              CustomSettingsItem(
                title: 'Add Available Times'.tr,
                icon: Icons.access_time,
                isArabic: Get.locale?.languageCode == 'ar',
                onTap: () {
                  Get.toNamed(AppRoutes.scheduleTime);
                },
              ),
          ],
        ).paddingDirectional(const EdgeInsetsDirectional.all(8));
      }),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}