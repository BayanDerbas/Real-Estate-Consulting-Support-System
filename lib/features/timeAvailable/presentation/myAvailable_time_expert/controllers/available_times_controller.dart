import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/networks/failures.dart';
import '../../../../../core/utils/secure_storage.dart';
import '../../../data/models/show_working_times_response.dart';
import '../../../data/models/working_times_model.dart';
import '../../../data/repositories/show_working_times_repository.dart';

class AvailableTimesController extends GetxController {
  final ShowWorkingTimesRepository repository;
  SecureStorage secureStorage = SecureStorage();

  AvailableTimesController({required this.repository});

  var isLoading = false.obs;
  var availableTimes = <AvailableTime>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadExpertTimes();
  }

  Future<void> loadExpertTimes() async {
    final String? expertIdStr = await secureStorage.getIdByRole();

    if (expertIdStr == null) {
      Get.snackbar('Error', 'Expert ID not found');
      return;
    }

    final int expertId = int.tryParse(expertIdStr) ?? 0;

    if (expertId == 0) {
      Get.snackbar('Error', 'Invalid Expert ID');
      return;
    }

    fetchAvailableTimes(expertId);
  }

  Future<void> fetchAvailableTimes(int expertId) async {
    try {
      isLoading.value = true;
      final Either<Failures, ShowAvailableTimesResponse> result =
      await repository.getAvailableTimes(expertId);

      result.fold(
            (failure) => Get.snackbar('Error', failure.err_message),
            (response) => availableTimes.value = response.data ?? [],
      );
    } finally {
      isLoading.value = false;
    }
  }
}
