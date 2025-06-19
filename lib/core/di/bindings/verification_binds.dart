import 'package:get/get.dart';
import 'package:graduation_project/features/Auth/data/repository/auth_repository.dart';

import '../../../features/Auth/presentation/controllers/verification_code_controller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationCodeController>(
      () => VerificationCodeController(Get.find<AuthRepository>()),
    );
  }
}
