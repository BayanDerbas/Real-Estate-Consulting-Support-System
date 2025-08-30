import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import '../../../../core/constants/Fonts.dart';
import '../../data/repository/booking_repository.dart';
import '../../data/repository/reservation_repository.dart';
import '../controllers/BookController.dart';
import '../widgets/Custom_Book.dart';

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;

    final int expertId = int.tryParse(args?['id']?.toString() ?? '0') ?? 0;
    final Map<String, dynamic>? expertData = args?['expert'];

    if (expertId == 0) {
      print("Error: Expert ID is null or 0");
      Get.snackbar('خطأ', 'معرف الخبير غير موجود.');
      return Scaffold(
        body: Center(child: Text("حدث خطأ، يرجى إعادة المحاولة.")),
      );
    }

    final controller = Get.put(BookController(
      expertId: expertId,
      expertData: expertData,
      repository: Get.find<ReservationRepository>(),
      bookingRepository: Get.find<BookingRepository>(),
    ));

    final String expertName = args?['name'] ?? "دكتور افتراضي";
    final String expertJob = args?['job'] ?? "استشاري نفسي";

    return Scaffold(
      backgroundColor: AppColors.softWhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Book Appointment",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Obx(() {
        final itemCount = controller.generatedHours.length;
        final rowCount = (itemCount / 4).ceil();
        final gridHeight = rowCount * 50.0;
        return SingleChildScrollView(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBook(
                image: expertData?['idCardImage'] ?? '',
                name: expertName,
                job: expertJob,
                rating: args?['rating'] ?? "4.5",
                experience: args?['experience'] ?? "3",
                successCount: args?['successCount'] ?? "12",
                monthDays: controller.getCurrentMonthDays(),
                selectedDate: controller.selectedDate.value,
                onDateSelected: controller.selectDate,
                monthName: controller.getMonthName(),
                onNextMonth: controller.goToNextMonth,
                onResetMonth: controller.isInCurrentMonth() ? null : controller.resetToCurrentMonth,
                showResetIcon: !controller.isInCurrentMonth(),
                sessionDuration: [15, 30],
                selectedSessionIndex: controller.selectedSessionIndex.value,
                onSessionSelected: controller.selectSession,
                selectedCallType: controller.selectedCallType.value,
                onCallTypeSelected: controller.selectCallType,
                appointmentHours: controller.generatedHours,
                isBooked: controller.generatedHours.length == controller.isBookedList.length
                    ? controller.isBookedList
                    : List.generate(controller.generatedHours.length, (_) => false),
                // appointmentHours: controller.generatedHours,
                // isBooked: controller.isBookedList,
                selectedHourIndex: controller.selectedHourIndex.value,
                onHourSelected: controller.selectHour,
                followerNum: args?['followersCount'] ?? "" ,
                gridHeight: gridHeight,
              ),
              SizedBox(height: 5,),
              Text(
                "Coupon Code",
                style: Fonts.itim.copyWith(
                    fontSize: 20,color: AppColors.deepNavy,),)
                  .padding(EdgeInsets.symmetric(horizontal: 13)),
              SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  prefixIcon: Icon(Icons.card_giftcard),
                ),
                style: Fonts.itim.copyWith(fontSize: 16,color: AppColors.deepNavy),
                onChanged: (value) => controller.setCouponCode(value),
              ).padding(const EdgeInsets.all(3)),
              const SizedBox(height: 5),
              CustomButton(
                text: controller.isLoading.value
                    ? "...جاري الحجز"
                    : controller.isLoadingTimes.value
                    ? "...جاري تحميل أوقات العمل"
                    : "حجز موعد",
                backgroundColor: controller.isLoading.value || controller.isLoadingTimes.value
                    ? AppColors.grey
                    : AppColors.deepNavy,
                textColor: AppColors.softWhite,
                width: double.infinity,
                height: 55,
                onPressed: controller.isLoading.value || controller.isLoadingTimes.value
                    ? null
                    : () async {
                  try {
                    if (controller.selectedSessionIndex.value == -1) {
                      Get.snackbar('خطأ', 'يرجى اختيار مدة الجلسة.');
                      return;
                    }
                    if (controller.selectedHourIndex.value == -1) {
                      Get.snackbar('خطأ', 'يرجى اختيار الساعة المناسبة.');
                      return;
                    }
                    if (controller.expert.value?.id == null) {
                      print("Error: Expert data is null -> ${controller.expert.value}");
                      Get.snackbar('خطأ', 'حدث خطأ بالخبير، حاول مرة أخرى.');
                      return;
                    }

                    final result = await controller.bookAppointment();
                    result.fold(
                          (failure) {
                        print("Booking Failed: ${failure.err_message}");
                      },
                          (response) {
                        print("Booking Success: $response");
                        Get.snackbar('نجاح', 'تم الحجز بنجاح');
                      },
                    );
                  } catch (e, stack) {
                    print("Unexpected Error: $e\n$stack");
                    Get.snackbar('خطأ', 'حدث خطأ غير متوقع، حاول مرة أخرى.');
                  }
                },
              ).padding(const EdgeInsets.symmetric(horizontal: 0, vertical: 10)),
            ],
          ),
        );
      }),
    );
  }
}