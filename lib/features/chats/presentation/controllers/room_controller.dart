import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/Auth/data/model/user_model.dart';
import 'package:graduation_project/features/chats/data/repository/chat_repository.dart';
import 'package:graduation_project/features/chats/presentation/controllers/chat_controller.dart';

class RoomController extends GetxController {
  int currentUserIdInt = 0;
  @override
  void onInit() async {
    String? currentUserStr = await _storage.getUserId();
    currentUserIdInt = int.parse(currentUserStr!);
  }

  final ChatRepository _chatRepository;
  final SecureStorage _storage = SecureStorage();

  RoomController(this._chatRepository);
  Future<void> createOrGoToChat(UserModel otherUser) async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
    try {
      final currentUserIdStr = await _storage.getUserId();
      if (currentUserIdStr == null) {
        throw Exception('Current user ID not found.');
      }

      print("--- DEBUG: CREATING CHAT ---");
      print("Current User ID (userId1): $currentUserIdStr");
      print("Other User ID (userId2): ${otherUser.id}");

      final result = await _chatRepository.createRoom(
        currentUserIdInt,
        otherUser.id,
      );

      Get.back();

      result.fold(
        (failure) {
          print('....................failure in room');
          print(failure.err_message);
          Get.snackbar(
            'Chat Error',
            'Could not start chat: ${failure.err_message}',
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        (roomResponse) {
          print('..................room status ');
          print(roomResponse.status);
          try {
            final chatController = Get.find<ChatController>();
            chatController.currentUserId = roomResponse.id;
            chatController.otherUser = roomResponse.user2!;
            Get.find<ChatController>().initializeChat();
            Get.toNamed(
              AppRoutes.chatPage,

              //  arguments: {'roomId': roomResponse.id, 'otherUser': otherUser},
            );
          } catch (e) {
            Get.snackbar(
              'Chat Error',
              'Invalid room format received from server.',
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        },
      );
    } catch (e) {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
      Get.snackbar(
        'Error',
        'An unexpected error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
