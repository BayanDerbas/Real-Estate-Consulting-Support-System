import 'package:get/get.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/change_password_controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    final email = Get.arguments['email'] ?? '';
<<<<<<< HEAD
    //Get.put(ChangePasswordController(Get.find())..userEmail = email);
=======
    Get.put(ChangePasswordController(Get.find())..userEmail = email);
>>>>>>> c7d731dd450c376d00dc6594eb046f0831d21a99
  }
}
