import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/Book/data/model/booking_request_model.dart';
import 'package:intl/intl.dart';
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
  String formatDate(String? dateTime) {
    if (dateTime == null || dateTime.isEmpty) return "";
    try {
      final parsed = DateTime.parse(dateTime);
      return formatDate("yyyy-MM-dd HH:mm");
    } catch (e) {
      print("❌ Date parse error in UI: $e");
      return dateTime;
    }
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
        startDate: formatDate(startDate),
        couponCode: coupon,
        clientSecret: clientSecret,
      );
      final result = await bookingRepository.createBooking(request);
      result.fold(
              (failure) => print(failure.err_message),
              (response) {
        bookingResponse.value = response;
        print(
          "///////////////// Response Booking /////////////////\n$response",
        );
        print('Booking created successfully');
      });
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
