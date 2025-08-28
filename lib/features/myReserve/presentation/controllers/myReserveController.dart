import 'package:get/get.dart';
import 'package:graduation_project/core/networks/dio_factory.dart';
import 'package:graduation_project/features/Book/data/model/booking_data_model.dart';
import 'package:graduation_project/features/myReserve/data/repositories/myReserve_repository.dart';

import '../../../../core/utils/secure_storage.dart';

class myReserveController extends GetxController {
  final MyReserveRepository repository;

  myReserveController(this.repository);
  var isLoading = false.obs;
  var reservations = <BookingData>[].obs;
  var selectedStatus = 'PENDING'.obs;
  var statuses = ['PENDING', 'CONFIRMED', 'CANCELED', 'COMPLETED'].obs;
  var role = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadRole();
  }

  Future<void> _loadRole() async {
    final userRole = await SecureStorage().getUserType();
    role.value = userRole ?? 'USER';
  }

  void changeStatus(String status) {
    selectedStatus.value = status;
    fetchReservations(status);
  }

  Future<void> fetchReservations(String status) async {
    isLoading.value = true;
    DioFactory.loadToken();
    final result = await repository.getReserveationByStatus(status);
    isLoading.value = false;
    result.fold(
      (failure) {
        print(
          "//////////////////////////////////////////////////////////////\n${failure.err_message}",
        );
        reservations.value = [];
      },
      (result) async {
        reservations.value = result.data ?? [];

        print("=============== Reservations from API ===============");
        for (var r in reservations) {
          print("""
    📌 ID: ${r.id}
    👤 Client: ${r.client?.firstName ?? ''} ${r.client?.lastName ?? ''}
    🎓 Expert: ${r.expert?.user?.firstName ?? ''} ${r.expert?.user?.lastName ?? ''}
    💼 Profession: ${r.expert?.profession ?? 'غير معروف'}
    📞 Call Type: ${r.callType ?? 'غير معروف'}
    ⏱️ Duration: ${r.duration ?? 0}
    🕒 Start Time: ${r.startTime ?? 'غير معروف'}
    📌 Status: ${r.bookingStatus ?? 'غير معروف'}
    ----------------------------------------
    """);
        }
        await SecureStorage().saveReservations(reservations);
      },
    );
  }

  Future<void> loadCashedReservations() async {
    await SecureStorage().getReservations();
  }
}
