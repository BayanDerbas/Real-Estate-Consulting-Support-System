import 'package:get/get.dart';
import 'package:graduation_project/features/Auth/data/repository/auth_repository.dart';

class SendCodeController extends GetxController {
  final AuthRepository _authRepository;
  SendCodeController(this._authRepository);

  Future<void> sendCode(String email) async {
    await _authRepository.sendCode(email);
  }
}
