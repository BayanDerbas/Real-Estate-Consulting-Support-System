import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/change_password_controller.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/login_controller.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/signup_controller.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/verification_code_controller.dart';
import '../../features/Auth/data/data_source/auth_service/auth_service.dart';
import '../../features/Auth/data/repository/auth_repository.dart';
import '../networks/dio_factory.dart';

class DependenceInitializer {
  static dependenceInjection() {
    Get.lazyPut<Dio>(() => DioFactory.getDio(), fenix: true);

    Get.lazyPut(() => AuthService(Get.find()));
    Get.lazyPut(() => AuthRepository(Get.find()));
    Get.put(RegisterController(Get.find()));
    Get.put(LoginController(Get.find()));
    Get.put(ChangePasswordController(Get.find()));
  }
}
