import 'package:get/get.dart';
import '../../../../core/utils/secure_storage.dart';

class SettingsController extends GetxController {
  final SecureStorage _secureStorage = SecureStorage();
  var role = ''.obs;
  bool get isExpert => role.value == "EXPERT";
  bool get isOffice => role.value == "OFFICE";

  @override
  void onInit() {
    super.onInit();
    _loadRole();
  }

  Future<void> _loadRole() async {
    final userRole = await _secureStorage.getUserType();
    role.value = userRole ?? '';
  }
}