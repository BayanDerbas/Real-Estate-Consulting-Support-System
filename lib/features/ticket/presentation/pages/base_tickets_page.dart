import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';

import '../controllers/page_controller.dart';

class BaseTicketsPage extends StatelessWidget {
  BaseTicketsPage({super.key});
  PageTicketController controller = Get.put(PageTicketController());
  @override
  Widget build(BuildContext context) {
    final double currentWidth = Get.width;
    final double currentHeight = Get.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: 'الكل',
                  backgroundColor: AppColors.deepNavy,
                  textColor: AppColors.pureWhite,
                  width: currentWidth / 3,
                  onPressed: () => controller.changePageIndex(0),
                ),
                CustomButton(
                  text: 'طلباتي',
                  backgroundColor: AppColors.deepNavy,
                  textColor: AppColors.pureWhite,
                  width: currentWidth / 3,
                  onPressed: () => controller.changePageIndex(1),
                ),
              ],
            ).scrollDirection(Axis.horizontal),
          ],
        ),
      ),
    );
  }
}
