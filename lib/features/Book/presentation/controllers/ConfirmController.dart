import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/Book/data/model/booking_request_model.dart';
import '../../data/model/booking_response.dart';
import '../../data/repository/booking_repository.dart';

class ConfirmController extends GetxController {
  final TextEditingController discountCodeController = TextEditingController();
  final BookingRepository bookingRepository;
  var isLoading = false.obs;
  var bookingResponse = Rxn<BookingResponse>();

  ConfirmController(this.bookingRepository);

  @override
  void onClose() {
    discountCodeController.dispose();
    super.onClose();
  }

  Future<void> confirmBooking(
    int expertId,
    int clientId,
    String callType,
    int duration,
    String startDate,
    String clientSecret,
  ) async {
    try {
      isLoading.value = true;
      String? coupon =
          discountCodeController.text.trim().isNotEmpty
              ? discountCodeController.text.trim()
              : '';
      final request = BookingRequest(
        expertId: expertId,
        clientId: clientId,
        callType: callType,
        duration: duration,
        startDate: startDate,
        couponCode: coupon,
        clientSecret: clientSecret,
      );
      final result = await bookingRepository.createBooking(request);
      result.fold((failure) => Get.snackbar('Error', failure.err_message), (
        response,
      ) {
        bookingResponse.value = response;
        print(
          "///////////////// Response Booking /////////////////\n$response",
        );
        Get.snackbar('Success', 'Booking created successfully');
      });
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}

// class ConfirmController extends GetxController {
//   final discountCodeController = TextEditingController();
//
//   @override
//   void onClose() {
//     discountCodeController.dispose();
//     super.onClose();
//   }
//
//   void confirmBooking() {
//     final code = discountCodeController.text.trim();
//     if (code.isNotEmpty) {
//       Get.snackbar("تم", "تم استخدام الكود: $code");
//     } else {
//       Get.snackbar("تنبيه", "الرجاء إدخال كود الخصم إذا وُجد");
//     }
//   }
// }
