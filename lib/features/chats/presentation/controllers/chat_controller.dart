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
  final ChatRepository chatRepository;
  final SecureStorage storage = SecureStorage();

  ChatController(this.chatRepository);

  final content = TextEditingController();
  var messages = <Message>[].obs;
  var isLoading = true.obs;
  var isConnected = false.obs;

  int? roomId;
  UserModel? otherUser;
  int? currentUserId;

  late StompClient stompClient;

  Future<void> initializeChat() async {
    isLoading.value = true;
    try {
      final storedId = await storage.getUserId();
      if (storedId == null) throw Exception('User ID not found.');
      currentUserId = int.tryParse(storedId);

      if (roomId == null || otherUser == null || currentUserId == null) {
        throw Exception('Missing required chat data.');
      }

      await _fetchInitialMessages();
      _connectAndSubscribe();
    } catch (e) {
      log("Initialization failed: $e");
      Get.snackbar('Error', 'Chat setup failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _fetchInitialMessages() async {
    final result = await chatRepository.getMessagesForCurrentRoom(
      id: roomId!,
      page: 0,
      size: 50,
    );
    result.fold(
      (failure) {
        log("Fetch failed: ${failure.err_message}");
        Get.snackbar('Error', 'Could not load messages.');
      },
      (initialMessages) {
        messages.assignAll(initialMessages.reversed);
      },
    );
  }

  void _connectAndSubscribe() async {
    final token = await storage.getToken();

    stompClient = StompClient(
      config: StompConfig(
        url: 'ws://195.88.87.77:8000/chat',
        onConnect: (frame) {
          isConnected.value = true;
          stompClient.subscribe(
            destination: "/topic/room/$roomId",
            callback: (frame) {
              final body = frame.body;
              if (body != null) {
                try {
                  final newMessage = Message.fromJson(jsonDecode(body));
                  messages.insert(0, newMessage);
                } catch (e) {
                  log("Message parse error: $e");
                }
              }
            },
          );
        },
        onDisconnect: (_) => isConnected.value = false,
        onWebSocketError: (_) => isConnected.value = false,
        heartbeatIncoming: Duration.zero,
        heartbeatOutgoing: Duration.zero,
        stompConnectHeaders: {'Authorization': token ?? ''},
      ),
    );

    stompClient.activate();
  }

  void sendMessage() {
    if (content.text.isEmpty || !isConnected.value || currentUserId == null) {
      return;
    }

    final messageToSend = {
      'senderId': currentUserId,
      'content': content.text,
      'roomId': roomId,
    };

    stompClient.send(
      destination: "/app/chat/send-message",
      body: jsonEncode(messageToSend),
    );

    final optimisticMessage = Message(
      sender: UserModel(id: currentUserId!),
      content: content.text,
      createdAt: DateTime.now().toIso8601String(),
    );

    messages.insert(0, optimisticMessage);
    content.clear();
  }

  @override
  void onClose() {
    stompClient.deactivate();
    content.dispose();
    super.onClose();
  }
}
