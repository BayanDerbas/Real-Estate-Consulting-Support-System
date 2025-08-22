import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/stripe/stripe.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/data_source/booking_api_service.dart';
import '../../data/model/booking_data_model.dart';
import '../../data/repository/booking_repository.dart';
import '../controllers/ConfirmController.dart';
import '../controllers/PayementController.dart';
import '../widgets/Custom_Confirm.dart';
import '../widgets/Custom_PaymentBottomSheet.dart';

class Confirm extends StatelessWidget {
  Confirm({super.key});

  final PaymentController paymentController = Get.put(PaymentController());
  final ConfirmController confirmController = Get.put(
    ConfirmController(BookingRepositoryImpl(Get.find<BookingService>())),
  );
  String formatDate(String? dateTime) {
    if (dateTime == null || dateTime.isEmpty) return "";
    try {
      final parsed = DateTime.parse(dateTime);
      return DateFormat("yyyy-MM-dd HH:mm").format(parsed);
    } catch (e) {
      print("❌ Date parse error in UI: $e");
      return dateTime;
    }
  }


  void _showPaymentBottomSheet(BuildContext context, BookingData booking) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return CustomPaymentBottomSheet(
          finalPrice: booking.finalPrice?.toString() ?? "0.0",
          clientSecret: booking.clientSecret ?? "",
          onClose: () {
            paymentController.clearFields();
            Navigator.pop(context);
          },
            onPay: () async {
              try {
                print("💳 Starting payment with clientSecret: ${booking.clientSecret}");
                final result = await StripeService.presentPayementSheet(booking.clientSecret ?? "");
                print("✅ Payment result: $result");

                if (result) {
                  Get.snackbar('نجاح', 'تم الدفع بنجاح!');
                  Get.offAllNamed('/home');
                } else {
                  print("❌ Payment failed");
                  Get.snackbar('خطأ', 'فشل الدفع، حاول مرة أخرى.');
                }
              } catch (e) {
                print("⚠️ Payment exception: $e");
                Get.snackbar('خطأ', 'فشل الدفع: $e');
              }
            }
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final BookingData? booking = Get.arguments['booking'] as BookingData?;
    if (booking == null) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: CustomAppbar(
            text: "Confirm Payment",
            icon: Icons.notifications,
            iconColor: AppColors.pureWhite,
          ),
        ),
        body: const Center(
          child: Text(
            'خطأ: لا يوجد بيانات حجز',
            style: TextStyle(fontSize: 18, color: AppColors.grey),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Welcome Payment",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomConfirm(
              calltype: booking.callType ?? "",
              time: "${booking.duration ?? 0} دقيقة",
              expertName: booking.expert?.user?.firstName ?? "الخبير",
              price: "${booking.originalPrice ?? 0.0}",
              dateTime: "${formatDate(booking.startTime)} - ${formatDate(booking.endTime)}",
              sessionPrice: "${booking.originalPrice ?? 0.0}",
              discountRate: "${booking.discountAmount ?? 0.0}",
              finalPrice: "${booking.finalPrice ?? 0.0}",
              controller: confirmController.discountCodeController,
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: "الدفع وتأكيد الحجز",
              backgroundColor: AppColors.deepNavy,
              textColor: AppColors.pureWhite,
              width: 375,
              onPressed: () {
                confirmController.confirmBooking(
                  booking.expert!.id!,
                  booking.client!.id!,
                  booking.callType!,
                  booking.duration!,
                  formatDate(booking.startTime!),
                  booking.clientSecret!,
                );
                _showPaymentBottomSheet(context, booking);
              },
            ),
          ],
        ),
      ),
    );
  }
}