import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/core/widgets/custom_search_text_field.dart';
import 'package:graduation_project/features/filter/controllers/ticket_filter_controller.dart';
import 'package:graduation_project/features/ticket/data/model/filter_model.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/get_all_tickets_controller.dart';
import '../controllers/page_controller.dart';
import 'all_tickets.dart';
import 'my_tickets.dart';

class BaseTicketsPage extends GetView<PageTicketController> {
  const BaseTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TicketFilterController());
    final tapController = Get.put(PageTicketController());
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
            SizedBox(height: currentWidth * 0.05),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchTextField(
                  controller: controller.search,
                  onFieldSubmitted: (value) {
                    Get.find<GetAllTicketsController>().filter(
                      filterItems: [
                        FilterItemModel(
                          operation: OperationEnum.LIKE_TICKET_CLIENT_NAME,
                          value: controller.search.text,
                        ),
                        // FilterItemModel(
                        //   column: "description",
                        //   operation: OperationEnum.LIKE,
                        //   value: controller.search.text,
                        // ),
                        // FilterItemModel(
                        //   column: "location",
                        //   operation: OperationEnum.LIKE,
                        //   value: controller.search.text,
                        // ),
                      ],
                      globalOperator: GlobalOperatorEnum.OR,
                    );
                  },
                  hint: "search by username",
                ).expanded(flex: 1),
                IconButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.ticketFilterPage);
                  },
                  icon: Icon(
                    Icons.filter_alt_rounded,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 16),
            SizedBox(height: currentWidth * 0.05),
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
                        tapController.currentpPage.value == 0
                            ? AppColors.deepNavy
                            : AppColors.pureWhite,
                    onPressed: () => tapController.changePageIndex(0),
                  ),
                  SizedBox(width: currentWidth * 0.1),
                  CustomButton(
                    text: 'طلباتي'.tr,
                    backgroundColor: AppColors.pureWhite,
                    textColor: AppColors.deepNavy,
                    width: currentWidth / 3,
                    height: 35,
                    borderColor:
                        tapController.currentpPage.value == 1
                            ? AppColors.deepNavy
                            : AppColors.pureWhite,
                    onPressed: () => tapController.changePageIndex(1),
                  ),
                ],
              ),
            ).scrollDirection(Axis.horizontal),
            SizedBox(height: currentWidth * 0.05),
            Expanded(
              child: Obx(() {
                return tapController.currentpPage.value == 0
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
