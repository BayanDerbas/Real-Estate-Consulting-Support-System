import 'package:get/get.dart';
import 'package:graduation_project/features/chats/presentation/controllers/chat_controller.dart';

import '../../../features/ticket/presentation/controllers/my_tickets_controller.dart';

class UserChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController(Get.find()), fenix: true);
  }
}
