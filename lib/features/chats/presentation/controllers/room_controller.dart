import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/Auth/data/model/user_model.dart';
import 'package:graduation_project/features/chats/data/repository/chat_repository.dart';
import 'package:graduation_project/features/chats/presentation/controllers/chat_controller.dart';

class RoomController extends GetxController {
  final ChatRepository _chatRepository;
  final SecureStorage _storage = SecureStorage();

  int currentUserIdInt = 0;

  RoomController(this._chatRepository);

  @override
  void onInit() {
    super.onInit();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    String? currentUserStr = await _storage.getUserId();
    if (currentUserStr != null) {
      currentUserIdInt = int.parse(currentUserStr);
    }
  }

  Future<void> createOrGoToChat(UserModel otherUser) async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      final result = await _chatRepository.createRoom(
        currentUserIdInt,
        otherUser.id,
      );

      Get.back();

      result.fold(
        (failure) {
          Get.snackbar(
            'Chat Error',
            'Could not start chat: ${failure.err_message}',
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        (roomResponse) async {
          print('room has been success ${roomResponse.toJson()}');
          try {
            final chatController = Get.find<ChatController>();
            chatController.roomId = roomResponse.id!;
            chatController.otherUser = otherUser;
            await chatController.initializeChat();

            Get.toNamed(AppRoutes.chatPage);
          } catch (e) {
            Get.snackbar(
              'Chat Error',
              'Chat initialization failed: $e',
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
        'Unexpected error: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
