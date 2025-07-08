import 'package:get/get.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/page_controller.dart';

class BaseTicketsBinds extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PageTicketController());
  }
}
