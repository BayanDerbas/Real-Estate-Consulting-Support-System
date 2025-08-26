import 'package:get/get.dart';
import 'package:graduation_project/core/utils/secure_storage.dart'; // Import SecureStorage
import 'package:graduation_project/features/officers/data/repository/OfficeRepository.dart';
import '../../data/model/office_profile_model.dart';

class OfficeProfileController extends GetxController {
  final OfficeRepository _repository;
  final SecureStorage _secureStorage;

  OfficeProfileController(this._repository, this._secureStorage);

  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var profile = Rxn<OfficeProfileModel>();

  @override
  void onInit() {
    super.onInit();
    fetchCurrentOfficeProfile();
  }

  Future<void> fetchCurrentOfficeProfile() async {
    try {
      isLoading(true);
      errorMessage('');

      final stringId = await _secureStorage.getIdByRole();

      if (stringId == null) {
        throw Exception("User ID not found. Please log in again.");
      }

      final id = int.parse(stringId);

      final result = await _repository.getOfficeProfile(id: id);
      result.fold(
        (failure) {
          errorMessage.value = failure.err_message;
        },
        (data) {
          profile.value = data;
        },
      );
    } catch (e) {
      errorMessage.value = "Failed to load profile: ${e.toString()}";
    } finally {
      isLoading(false);
    }
  }
}
