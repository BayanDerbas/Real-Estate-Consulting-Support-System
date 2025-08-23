import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/Auth/data/model/user_model.dart';
import 'package:graduation_project/features/chats/data/repository/chat_repository.dart';
import 'package:graduation_project/features/chats/presentation/controllers/chat_controller.dart';
import 'package:graduation_project/features/officers/data/model/userOffice.dart';
import '../../data/model/rooms_of_current_user.dart';

class GetCurrentUserRoomsController extends GetxController {
  final ChatRepository _chatRepository;
  final SecureStorage _storage = SecureStorage();

  int currentUserIdInt = 0;
  var isLoading = false.obs;
  var rooms = <RoomsOfCurrentUser>[].obs;
  var searchQuery = ''.obs;

  GetCurrentUserRoomsController(this._chatRepository);

  List<RoomsOfCurrentUser> get filteredRooms {
    if (searchQuery.value.isEmpty) return rooms;
    final query = searchQuery.value.toLowerCase();
    return rooms.where((room) {
      final user = room.otherUser;
      final name =
          "${user?.firstName ?? ''} ${user?.lastName ?? ''}".toLowerCase();
      final email = user?.email?.toLowerCase() ?? '';
      return name.contains(query) || email.contains(query);
    }).toList();
  }

  @override
  void onInit() {
    super.onInit();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    String? currentUserStr = await _storage.getUserId();
    if (currentUserStr != null) {
      currentUserIdInt = int.parse(currentUserStr);
      await getAllRooms();
    }
  }

  Future<void> getAllRooms() async {
    isLoading.value = true;
    try {
      final result = await _chatRepository.getRoomsOfCurrentUser(
        userId: currentUserIdInt,
      );
      result.fold(
        (failure) {
          rooms.clear();
          Get.snackbar('Error', failure.err_message ?? 'Failed to load rooms');
        },
        (roomList) {
          final filtered =
              roomList
                  .where((room) => room.otherUser?.id != currentUserIdInt)
                  .toList();
          rooms.assignAll(filtered);
        },
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> goToExistingRoom(RoomsOfCurrentUser room) async {
    final user = room.otherUser;
    if (user?.id == currentUserIdInt) return;
    if (user?.status != "AVAILABLE") {
      Get.snackbar(
        'User Unavailable',
        '${user?.firstName ?? 'This user'} is currently ${user?.status}',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final chatController = Get.put(ChatController(Get.find()));
    chatController.roomId = room.id;
    chatController.otherUser.value = UserModel(
      id: user!.id,
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      phone: user.phone,
      enabled: user.enabled,
      role: user.role,
      status: user.status,
      imageUrl: user.imageUrl,
    );
    await chatController.initializeChat();
    Get.toNamed(AppRoutes.chatPage);
  }
}
