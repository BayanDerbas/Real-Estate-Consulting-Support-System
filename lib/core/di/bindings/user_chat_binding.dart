import 'package:get/get.dart';
import 'package:graduation_project/features/chats/presentation/controllers/chat_controller.dart';
import 'package:graduation_project/features/chats/presentation/controllers/room_controller.dart';

class ChatFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController(Get.find()));
    Get.lazyPut(() => RoomController(Get.find()));
  }
}
