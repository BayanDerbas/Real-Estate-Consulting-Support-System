import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/Auth/data/model/user_model.dart';
import 'package:graduation_project/features/chats/data/repository/chat_repository.dart';
import 'package:graduation_project/features/chats/presentation/controllers/chat_controller.dart';
import 'package:graduation_project/features/officers/data/model/userOffice.dart';

import 'get_current_user_rooms_controller.dart';

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

  Future<void> findOrCreateRoom(UserOffice otherUser) async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      final roomsResult = await _chatRepository.getRoomsOfCurrentUser(
        userId: currentUserIdInt,
      );
      await roomsResult.fold(
        (failure) async {
          await _createRoomAndNavigate(otherUser);
        },
        (rooms) async {
          final existingRoom = rooms.firstWhereOrNull(
            (room) => room.otherUser?.id == otherUser.id,
          );
          if (existingRoom != null) {
            Get.back();
            await _navigateToChat(existingRoom.id!, otherUser);
          } else {
            await _createRoomAndNavigate(otherUser);
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

  Future<void> deleteCurrentRoom(int roomId) async {
    final result = await _chatRepository.deleteRoom(roomId);
    result.fold(
      (failure) =>
          Get.snackbar('Error', failure.err_message ?? 'Failed to delete room'),
      (_) {
        Get.back();
        Get.back();
        final roomsController = Get.find<GetCurrentUserRoomsController>();
        roomsController.getAllRooms();
        Get.snackbar('Success', 'Room deleted successfully');
      },
    );
  }

  Future<void> _createRoomAndNavigate(UserOffice otherUser) async {
    final createResult = await _chatRepository.createRoom(
      currentUserIdInt,
      otherUser.id!,
    );
    Get.back();
    createResult.fold(
      (failure) {
        Get.snackbar(
          'Chat Error',
          'Could not start chat: ${failure.err_message}',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      (roomResponse) async {
        await _navigateToChat(roomResponse.id!, otherUser);
      },
    );
  }

  Future<void> _navigateToChat(int roomId, UserOffice otherUser) async {
    try {
      final chatController = Get.put(ChatController(Get.find()));
      chatController.roomId = roomId;
      chatController.otherUser.value = UserModel(
        id: otherUser.id!,
        firstName: otherUser.firstName,
        lastName: otherUser.lastName,
        email: otherUser.email,
        phone: otherUser.phone,
        enabled: otherUser.enabled,
        role: otherUser.role,
        status: otherUser.status,
        imageUrl: otherUser.imageUrl,
      );
      await chatController.initializeChat();
      Get.toNamed(AppRoutes.chatPage);
    } catch (e) {
      Get.snackbar(
        'Chat Error',
        'Chat initialization failed: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> createOrGoToChat(UserModel otherUser) async {}
}
