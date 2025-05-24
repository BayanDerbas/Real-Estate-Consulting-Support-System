import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/features/Book/presentation/widgets/Custom_Book.dart';
import '../../../../core/constants/image_paths.dart';
import '../controllers/BookController.dart';

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    final BookController controller = Get.put(BookController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: CustomAppbar(
          text: "appointement",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Obx(() {
        return Column(
          children: [
            CustomBook(
              image: AppImages.expert,
              name: "محمد محمد",
              job: "محامي",
              rating: "5",
              experience: "10",
              successCount: "20",
              followerNum: "3",
              weekDays: controller.getCurrentWeek(),
              selectedDate: controller.selectedDate.value,
              onDateSelected: controller.selectDate,
              monthName: controller.getMonthName(),
              onNextMonth: controller.goToNextMonth,
              onResetMonth:
                  controller.isInCurrentMonth()
                      ? null
                      : controller.resetToCurrentMonth,
              showResetIcon: !controller.isInCurrentMonth(),
              sessionDuration: [30, 60, 90],
              selectedSessionIndex: controller.selectedSessionIndex.value,
              onSessionSelected: controller.selectSession,
              selectedCallType: controller.selectedCallType.value,
              onCallTypeSelected: controller.selectCallType,
              appointmentHours: [
                "11:00AM", "12:00AM", "1:00AM", "2:00AM", "3:00AM", "4:00AM", "5:00AM", "6:00AM"
              ],
              isBooked: [true, false, false, true, false, true, false, false],
              selectedHourIndex: controller.selectedHourIndex.value,
              onHourSelected: controller.selectHour,
            ),
            CustomButton(
                text: "حجز موعد",
                backgroundColor: AppColors.deepNavy,
                textColor: AppColors.softWhite,
                width: double.infinity,
              onPressed: () {
                  print("................................................");
                  Get.toNamed('/confirm');
              },
            ).padding(EdgeInsets.all(15)),
          ],
        );
      }).scrollDirection(Axis.vertical),
    );
  }
}
