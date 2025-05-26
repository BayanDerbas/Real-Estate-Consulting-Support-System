import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/Discounts/presentation/controllers/DiscountsController.dart';
import 'package:graduation_project/features/Discounts/presentation/widgets/Custom_AddDiscountDialog.dart';
import 'package:graduation_project/features/Discounts/presentation/widgets/Custom_DiscountCard.dart';

class CustomDiscounts extends StatelessWidget {
  final List<Color> discountColors;
  final String noDiscountsText;
  final TextStyle noDiscountsTextStyle;
  final double floatingButtonSize;
  final Color floatingButtonColor;
  final IconData floatingButtonIcon;
  final Color floatingButtonIconColor;
  final double floatingButtonIconSize;
  final EdgeInsets floatingButtonPosition;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final void Function(int index) onDelete;

  const CustomDiscounts({
    super.key,
    required this.discountColors,
    required this.noDiscountsText,
    required this.noDiscountsTextStyle,
    required this.floatingButtonSize,
    required this.floatingButtonColor,
    required this.floatingButtonIcon,
    required this.floatingButtonIconColor,
    required this.floatingButtonIconSize,
    required this.floatingButtonPosition,
    required this.onSave,
    required this.onCancel,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final DiscountsController controller = Get.find<DiscountsController>();

    return SizedBox.expand(
      child: Stack(
        children: [
          Obx(() {
            return controller.discounts.isEmpty
                ? Center(
              child: Text(noDiscountsText, style: noDiscountsTextStyle),
            )
                : GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: controller.discounts.length,
              itemBuilder: (context, index) {
                final discountData = controller.discounts[index];
                final color = discountColors[index % discountColors.length];
                return CustomDiscountCard(
                  discountData: discountData,
                  cardColor: color,
                  onDelete: () => onDelete(index),
                );
              },
            );
          }),
          Positioned(
            bottom: floatingButtonPosition.bottom,
            right: floatingButtonPosition.right,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => CustomAddDiscountDialog(
                    tabController: controller.tabController,
                    codeController: controller.codeController,
                    amountController: controller.amountController,
                    validityController: controller.validityController,
                    sessionsBeforeDiscountController: controller.sessionsBeforeDiscountController,
                    discountPercentageController: controller.discountPercentageController,
                    expiryDateController: controller.expiryDateController,
                    descriptionController: controller.descriptionController,
                    descriptionSessionsController: controller.descriptionSessionsController,
                    onSave: onSave,
                    onCancel: onCancel,
                  ),
                );
              },
              child: Container(
                height: floatingButtonSize,
                width: floatingButtonSize,
                decoration: BoxDecoration(
                  color: floatingButtonColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  floatingButtonIcon,
                  color: floatingButtonIconColor,
                  size: floatingButtonIconSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
