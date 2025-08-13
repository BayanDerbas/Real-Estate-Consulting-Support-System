import 'package:get/get.dart';
import 'package:graduation_project/features/Book/data/model/booking_data_model.dart';
import 'package:graduation_project/features/myReserve/data/repositories/myReserve_repository.dart';

import '../../../../core/utils/secure_storage.dart';

class myReserveController extends GetxController{
  final MyReserveRepository repository ;

  myReserveController(this.repository);
  var isLoading = false.obs;
  var reservations = <BookingData>[].obs;
  var selectedStatus = 'PENDING'.obs;
  var statuses = ['PENDING','CONFIRMED','CANCELED','COMPLETED'].obs;

  @override
  void onInit(){
    super.onInit();
    loadCashedReservations();
    fetchReservations(selectedStatus.value);
  }

  void changeStatus(String status) {
    selectedStatus.value = status;
    fetchReservations(status);
  }

  Future <void> fetchReservations(String status) async {
    isLoading.value = true;
    final result = await repository.getReserveationByStatus(status);
    isLoading.value = false;
    result.fold(
        (failure){
          print("//////////////////////////////////////////////////////////////\n${failure.err_message}");
          Get.snackbar("Error", failure.err_message);
          reservations.value = [];
        },
        (result) async {
          reservations.value = result.data ?? [];
          await SecureStorage().saveReservations(reservations);
        }
    );
  }

  Future<void> loadCashedReservations() async{
    await SecureStorage().getReservations();
  }
}