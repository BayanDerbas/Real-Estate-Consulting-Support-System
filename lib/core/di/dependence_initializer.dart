import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/signup_controller.dart';
import '../../features/Auth/data/repository/auth_repository.dart';
import '../networks/auth_service/auth_service.dart';
import '../networks/dio_factory.dart';

class DependenceInitializer {
  static dependenceInjection() {
    Get.lazyPut<Dio>(() => DioFactory.getDio(), fenix: true);

    Get.lazyPut(() => AuthService(Get.find()));
    Get.lazyPut(() => AuthRepository(Get.find()));
    Get.put(RegisterController(Get.find()));
  }
}
