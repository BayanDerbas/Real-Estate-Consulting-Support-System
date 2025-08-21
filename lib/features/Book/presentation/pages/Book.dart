import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import '../../../../core/constants/image_paths.dart';
import '../controllers/BookController.dart';
import '../widgets/Custom_Book.dart';

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    final BookController controller = Get.find<BookController>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Book Appointement",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Obx(() {
        final expert = controller.expert.value;
        final hours =
            controller.generatedHours.isNotEmpty
                ? controller.generatedHours
                : [
                  "09:00",
                  "10:00",
                  "11:00",
                  "12:00",
                  "01:00",
                  "02:00",
                  "03:00",
                ];
        //controller.generateAppointmentHours();
        final isBooked = controller.isBookedList;
        if (hours.length != isBooked.length) {
          return const Center(child: CircularProgressIndicator());
        }
        if (hours.length != isBooked.length) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            CustomBook(
              image: expert?.idCardImage ?? AppImages.expert,
              name:
                  expert != null
                      ? "${expert.user?.firstName ?? ''} ${expert.user?.lastName ?? ''}"
                          .trim()
                      : "بدون اسم",
              job: expert?.profession ?? "غير معروف",
              rating: expert?.rating?.toString() ?? "0",
              experience: expert?.experience ?? "0",
              successCount: expert?.rateCount?.toString() ?? "0",
              followerNum: "3",
              monthDays: controller.getCurrentMonthDays(),
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
              appointmentHours: hours,
              isBooked: isBooked,
              selectedHourIndex: controller.selectedHourIndex.value,
              onHourSelected: controller.selectHour,
            ),
            CustomButton(
              text: "حجز موعد",
              backgroundColor:
                  hours.isEmpty || controller.isLoading.value
                      ? AppColors.grey
                      : AppColors.deepNavy,
              textColor: AppColors.softWhite,
              width: double.infinity,
              onPressed:
                  hours.isEmpty || controller.isLoading.value
                      ? null
                      : () async {
                        final result = await controller.bookAppointment();
                        result.fold(
                          (failure) => Get.snackbar('خطأ', failure.err_message),
                          (response) => null, // Handled in controller
                        );
                      },
            ).padding(const EdgeInsets.all(15)),
          ],
        ).scrollDirection(Axis.vertical);
      }),
    );
  }
}
