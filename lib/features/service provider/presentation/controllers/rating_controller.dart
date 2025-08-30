import 'package:get/get.dart';
import '../../../../core/utils/secure_storage.dart';
import '../../data/repository/rating/rating_repository.dart';

class RatingController extends GetxController {
  final RatingRepository repository;
  var isLoading = false.obs;
  var lastRating = 0.0.obs;
  var message = ''.obs;
  final storage = SecureStorage();

  RatingController(this.repository);

  Future<void> initRating(int id, String role) async {
    final saved = await storage.getRating(role: role, id: id);
    if (saved != null) {
      lastRating.value = saved;
    }
  }

  Future<void> rateServiceProvider({
    required String role,
    required int id,
    required double rate,
  }) async {
    try {
      isLoading.value = true;
      lastRating.value = rate;

      if (role == "EXPERT") {
        final result = await repository.rateExpert(id, rate);
        result.fold(
              (error) => message.value = error,
              (response) => message.value = response.data,
        );
      } else if (role == "OFFICE") {
        final result = await repository.rateOffice(id, rate);
        result.fold(
              (error) => message.value = error,
              (response) => message.value = response.data,
        );
      }
    } catch (e) {
      message.value = "خطأ غير متوقع: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
