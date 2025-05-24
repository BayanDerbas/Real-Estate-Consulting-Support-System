import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../networks/dio_factory.dart';

class DependenceInitializer {
  static dependenceInjection() {
    Get.lazyPut<Dio>(() => DioFactory.getDio(), fenix: true);
  }
}
