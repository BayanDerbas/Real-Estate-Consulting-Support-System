// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../data/model/booking_model.dart';
// import '../../data/repository/booking_repository.dart';
//
// class ConfirmController extends GetxController {
//   final TextEditingController discountCodeController = TextEditingController();
//   final BookingRepository bookingRepository;
//   var isLoading = false.obs;
//   var bookingResponse = Rxn<BookingResponse>();
//
//   ConfirmController(this.bookingRepository);
//
//   @override
//   void onClose() {
//     discountCodeController.dispose();
//     super.onClose();
//   }
//
//   Future<void> confirmBooking(Map<String, dynamic> bookingData) async {
//     try {
//       isLoading.value = true;
//       final result = await bookingRepository.createBooking(bookingData);
//       result.fold(
//             (failure) => Get.snackbar('Error', failure.err_message),
//             (response) {
//           bookingResponse.value = response;
//           Get.snackbar('Success', 'Booking created successfully');
//         },
//       );
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to create booking: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
//
// // class ConfirmController extends GetxController {
// //   final discountCodeController = TextEditingController();
// //
// //   @override
// //   void onClose() {
// //     discountCodeController.dispose();
// //     super.onClose();
// //   }
// //
// //   void confirmBooking() {
// //     final code = discountCodeController.text.trim();
// //     if (code.isNotEmpty) {
// //       Get.snackbar("تم", "تم استخدام الكود: $code");
// //     } else {
// //       Get.snackbar("تنبيه", "الرجاء إدخال كود الخصم إذا وُجد");
// //     }
// //   }
// // }