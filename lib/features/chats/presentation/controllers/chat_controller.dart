import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/chats/data/repository/chat_repository.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

import '../../../Auth/data/model/user_model.dart';
import '../../data/model/message_model.dart';

class ChatController extends GetxController {
  final content = TextEditingController();
  final SecureStorage storage = SecureStorage();
  final ChatRepository chatRepository;
  ChatController(this.chatRepository);

  var messages = <Message>[].obs;
  late StompClient stompClient;
  var isConnected = false.obs;
  var isLoading = true.obs;

  int? currentUserId;
  int? roomId;
  final Rx<UserModel?> otherUser = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();
    final userArgument = Get.arguments;
    if (userArgument is UserModel) {
      otherUser.value = userArgument;
    }
  }

  @override
  void onReady() {
    super.onReady();
    if (otherUser.value == null) {
      Get.snackbar('Error', 'Failed to load user data.');
      isLoading.value = false;
      return;
    }
    _initializeChat();
  }

  Future<void> _initializeChat() async {
    isLoading.value = true;
    try {
      final storedId = await storage.getUserId();
      if (storedId == null) {
        Get.snackbar('Error', 'Authentication error: User not found.');
        isLoading.value = false;
        return;
      }
      currentUserId = int.tryParse(storedId);

      if (currentUserId != null) {
        final roomResult = await chatRepository.createRoom(
          currentUserId!,
          otherUser.value!.id!,
        );
        roomResult.fold(
          (failure) {
            Get.snackbar(
              'Error',
              'Could not start chat: ${failure.err_message}',
            );
          },
          (room) async {
            roomId = int.parse(room.roomKey);
            log("Entered room with ID: $roomId");
            await _fetchInitialMessages();
            _connectAndSubscribe();
          },
        );
      } else {
        Get.snackbar('Error', 'User information is missing.');
      }
    } catch (e) {
      log("Initialization failed: $e");
      Get.snackbar('Error', 'An unexpected error occurred during chat setup.');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _fetchInitialMessages() async {
    if (roomId == null) return;
    final messagesResult = await chatRepository.getMessagesForCurrentRoom(
      roomId: roomId!,
      page: 0,
      size: 50,
    );
    messagesResult.fold(
      (failure) =>
          log("Failed to fetch initial messages: ${failure.err_message}"),
      (initialMessages) {
        messages.assignAll(initialMessages.reversed);
      },
    );
  }

  void _connectAndSubscribe() async {
    if (roomId == null) return;
    final userToken = await storage.getToken();

    stompClient = StompClient(
      config: StompConfig(
        url: 'ws://192.168.43.58:8080/chat',
        onConnect: (frame) {
          isConnected.value = true;
          stompClient.subscribe(
            destination: "/topic/room/$roomId",
            callback: (frame) {
              if (frame.body != null) {
                try {
                  final newMessage = Message.fromJson(jsonDecode(frame.body!));
                  messages.add(newMessage);
                } catch (e) {
                  log("Error parsing message: $e");
                }
              }
            },
          );
        },
        onDisconnect: (frame) => isConnected.value = false,
        onWebSocketError: (error) => isConnected.value = false,
        stompConnectHeaders: {'Authorization': userToken ?? ''},
      ),
    );
    stompClient.activate();
  }

  void sendMessage() {
    if (content.text.isEmpty ||
        roomId == null ||
        currentUserId == null ||
        !isConnected.value)
      return;

    final sender = UserModel(id: currentUserId!);
    final messageToSend = {
      'sender': sender.toJson(),
      'content': content.text,
      'roomId': roomId,
    };

    stompClient.send(
      destination: "/app/chat/send-message",
      body: jsonEncode(messageToSend),
    );

    final newMessage = Message(
      sender: sender,
      content: content.text,
      id: currentUserId!,
      createdAt: '',
    );
    messages.add(newMessage);

    content.clear();
  }

  @override
  void onClose() {
    stompClient.deactivate();
    content.dispose();
    super.onClose();
  }
}
