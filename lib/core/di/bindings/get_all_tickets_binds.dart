import 'package:get/get.dart';
import '../../../features/ticket/data/repository/ticket_repository.dart';
import '../../../features/ticket/presentation/controllers/create_ticket_controller.dart';
import '../../../features/ticket/presentation/controllers/get_all_tickets_controller.dart';

class GetAllTicketsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetAllTicketsController>(
      () => GetAllTicketsController(Get.find<TicketRepositoryImpl>()),
    );
  }
}
