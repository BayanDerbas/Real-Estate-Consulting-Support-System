import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import '../controllers/page_controller.dart';
import 'all_tickets.dart';
import 'my_tickets.dart';

class BaseTicketsPage extends GetView<PageTicketController> {
  const BaseTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double currentWidth = Get.width;

    return Scaffold(
      backgroundColor: AppColors.deepNavy,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.deepNavy,
        child: Icon(Icons.add_home, color: AppColors.pureWhite),
        onPressed: () {
          Get.offNamed(AppRoutes.createTicket);
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    text: 'الكل'.tr,
                    backgroundColor: AppColors.pureWhite,
                    textColor: AppColors.deepNavy,
                    width: currentWidth / 3,
                    height: 35,
                    borderColor:
                        controller.currentpPage.value == 0
                            ? AppColors.deepNavy
                            : AppColors.pureWhite,
                    onPressed: () => controller.changePageIndex(0),
                  ),
                  SizedBox(width: currentWidth * 0.1),
                  CustomButton(
                    text: 'طلباتي'.tr,
                    backgroundColor: AppColors.pureWhite,
                    textColor: AppColors.deepNavy,
                    width: currentWidth / 3,
                    height: 35,
                    borderColor:
                        controller.currentpPage.value == 1
                            ? AppColors.deepNavy
                            : AppColors.pureWhite,
                    onPressed: () => controller.changePageIndex(1),
                  ),
                ],
              ),
            ).scrollDirection(Axis.horizontal).paddingOnly(top: 50),
            SizedBox(height: currentWidth * 0.1),
            Expanded(
              child: Obx(() {
                return controller.currentpPage.value == 0
                    ? TicketsPage()
                    : MyTickets();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
