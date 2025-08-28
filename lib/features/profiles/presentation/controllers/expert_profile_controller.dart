import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/profiles/data/repository/profile_repository.dart';
import '../../../../core/utils/secure_storage.dart';
import '../../data/model/expert_profile_model.dart';

class ExpertController extends GetxController {
  final ProfileRepository profileRepository;
  final SecureStorage secureStorage = SecureStorage();

  ExpertController({required this.profileRepository});

  var expertProfile = Rxn<ExpertProfileModel>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> fetchExpertByRole() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      expertProfile.value = null;

      final String? id = await secureStorage.getIdByRole();

      if (id == null) {
        errorMessage.value = "No expert id found in storage";
        return;
      }

      final Either<String, ExpertProfileModel> result = await profileRepository
          .getExpert(id: int.parse(id));

      result.fold(
        (failure) {
          errorMessage.value = failure;
        },
        (data) {
          expertProfile.value = data;
        },
      );
    } catch (e) {
      errorMessage.value = "Unexpected error: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
