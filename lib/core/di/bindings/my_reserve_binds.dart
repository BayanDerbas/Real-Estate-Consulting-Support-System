import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../../../features/myReserve/data/data_sources/myReserve_api_service.dart';
import '../../../features/myReserve/data/repositories/myReserve_repository.dart';
import '../../../features/myReserve/presentation/controllers/myReserveController.dart';

class MyReserveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyReserveService>(() => MyReserveService(Get.find()), fenix: true);
    Get.lazyPut<MyReserveRepository>(() => MyReserveRepositoryImpl(Get.find()), fenix: true);
    Get.lazyPut<myReserveController>(() => myReserveController(Get.find()), fenix: true);
  }
}