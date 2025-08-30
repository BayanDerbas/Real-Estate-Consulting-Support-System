import 'package:get/get.dart';

import '../../../../core/networks/dio_factory.dart';
import '../../data/models/myBookings/my_bookings_model.dart';
import '../../data/repositories/myBookings_repository.dart';

class MyBookingsController extends GetxController {
  final MyBookingsRepository repository;

  MyBookingsController(this.repository);

  var isLoading = false.obs;
  var bookings = <MyBookingData>[].obs;
  var selectedStatus = 'PENDING'.obs;
  var statuses = ['PENDING', 'CONFIRMED', 'CANCELED', 'COMPLETED'].obs;

  void changeStatus(String status) {
    selectedStatus.value = status;
    fetchBookings(status);
  }

  Future<void> fetchBookings(String status) async {
    isLoading.value = true;

    print("📡 Fetching bookings with status: $status");
    final result = await repository.getBookings(status);

    isLoading.value = false;

    result.fold(
      (failure) {
        print("❌ API Error: ${failure.err_message}");
        Get.snackbar("Error", failure.err_message);
        bookings.value = [];
      },
      (response) {
        print("✅ API Response Body:");
        bookings.value = response.data ?? [];
      },
    );
  }
}