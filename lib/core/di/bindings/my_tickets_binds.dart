import 'package:get/get.dart';

import '../../../features/ticket/presentation/controllers/my_tickets_controller.dart';

class MyTicketsBinds extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyTicketsController(Get.find()), fenix: true);
  }
}
