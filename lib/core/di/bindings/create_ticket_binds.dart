import 'package:get/get.dart';
import '../../../features/ticket/data/repository/ticket_repository.dart';
import '../../../features/ticket/presentation/controllers/create_ticket_controller.dart';

class TicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateTicketController>(
      () => CreateTicketController(Get.find<TicketRepositoryImpl>()),
    );
  }
}
