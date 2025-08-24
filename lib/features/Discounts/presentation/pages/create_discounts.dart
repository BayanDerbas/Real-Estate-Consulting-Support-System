import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
import 'package:graduation_project/features/Discounts/presentation/controllers/DiscountsController.dart';
import 'package:graduation_project/features/Discounts/presentation/widgets/Custom_Discounts.dart';

class Discounts extends StatelessWidget {
  const Discounts({super.key});

  @override
  Widget build(BuildContext context) {
    final DiscountsController controller = Get.find<DiscountsController>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: 'Manage discounts',
          icon:Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomDiscounts(
          discountColors: [
            AppColors.lavender,
            AppColors.softPink,
            AppColors.babySky,
            AppColors.aquaBlue,
            AppColors.goldenYellow,
            AppColors.blushRose,
          ],
          noDiscountsText: "لا توجد خصومات بعد!",
          noDiscountsTextStyle: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
          floatingButtonSize: 56.0,
          floatingButtonColor: AppColors.deepNavy,
          floatingButtonIcon: Icons.add,
          floatingButtonIconColor: AppColors.pureWhite,
          floatingButtonIconSize: 40.0,
          floatingButtonPosition: const EdgeInsets.only(bottom: 10, right: 5),
          onSave: () {
            controller.addDiscount();
            print("تم حفظ الخصم!");
          },
          onCancel: () {
            controller.clearFields();
            print("تم إلغاء الإضافة");
          },
          onDelete: (int index) {
            controller.deleteDiscount(index);
          },
        ),
      ),
    );
  }
}
