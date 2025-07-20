import 'package:get/get.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/change_password_controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    final email = Get.arguments['email'] ?? '';
    //Get.put(ChangePasswordController(Get.find())..userEmail = email);
  }
}
