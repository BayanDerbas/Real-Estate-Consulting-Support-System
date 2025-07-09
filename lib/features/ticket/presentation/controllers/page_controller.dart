import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'get_all_tickets_controller.dart';
import 'my_tickets_controller.dart';

class PageTicketController extends GetxController {
  RxInt currentpPage = 0.obs;

  void changePageIndex(int index) {
    currentpPage.value = index;

    if (index == 0) {
      if (Get.isRegistered<GetAllTicketsController>()) {
        Get.find<GetAllTicketsController>().refreshTickets();
      }
    } else if (index == 1) {
      if (Get.isRegistered<MyTicketsController>()) {
        Get.find<MyTicketsController>().refreshTickets();
      }
    }
  }
}
