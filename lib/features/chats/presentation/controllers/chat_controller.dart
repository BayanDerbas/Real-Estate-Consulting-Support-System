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
  final Rx<UserModel?> otherUser = Rx<UserModel?>(null);
  int? currentUserId;

  StompClient? stompClient;

  @override
  void onClose() {
    log('--- ChatController onClose: Deactivating STOMP client. ---');
    stompClient?.deactivate();
    content.dispose();
    super.onClose();
  }

  Future<void> initializeChat() async {
    if (isConnected.value) return;

    log('--- 1. INITIALIZING CHAT ---');
    isLoading.value = true;
    try {
      final storedId = await storage.getUserId();
      if (storedId == null) throw Exception('User ID not found in storage.');
      currentUserId = int.tryParse(storedId);

      if (roomId == null || otherUser.value == null || currentUserId == null) {
        throw Exception('Chat data (room, user, etc.) is missing.');
      }

      log('--- 2. Fetching initial messages via HTTP... ---');
      await _fetchInitialMessages();

      log('--- 3. Starting WebSocket connection process... ---');
      _connect();
    } catch (e) {
      log("---  INITIALIZATION FAILED: $e ---", error: e);
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
      (failure) =>
          log("---  Fetch initial messages failed: ${failure.err_message} ---"),
      (initialMessages) {
        print('success fetch messages ...........');
        messages.assignAll(initialMessages.reversed);
      },
    );
  }

  void _connect() async {
    try {
      // if (stompClient.connected) {
      //   stompClient.deactivate();
      // }
      final token = await storage.getToken();
      stompClient = StompClient(
        config: StompConfig(
          url: 'ws://195.88.87.77:8000/chat',
          onConnect: (StompFrame frame) {
            isConnected.value = true;
            log("Connected to WebSocket");

            stompClient?.subscribe(
              destination: "/topic/room/$roomId",
              callback: (StompFrame frame) {
                if (frame.body != null) {
                  try {
                    log(frame.body.toString());
                    final newMessage = Message.fromJson(
                      jsonDecode(frame.body!),
                    );
                    messages.add(newMessage);
                    log("New message received: ${newMessage.content}");
                  } catch (e) {
                    log("Error parsing message: $e");
                  }
                }
              },
            );
          },
          onDisconnect: (StompFrame frame) {
            isConnected.value = false;
            log("Disconnected from WebSocket");
            _reconnect();
          },
          onWebSocketError: (dynamic error) {
            isConnected.value = false;
            log("WebSocket error: $error");
            _reconnect();
          },

          reconnectDelay: const Duration(seconds: 5),
          heartbeatIncoming: const Duration(seconds: 0),
          heartbeatOutgoing: const Duration(seconds: 0),
          stompConnectHeaders: {'Authorization': 'Bearer $token'}, //
        ),
      );

      stompClient?.activate();
    } catch (e) {
      log("Connection error: $e");
      isConnected.value = false;
      _reconnect();
    }
  }

  void _reconnect() {
    Future.delayed(const Duration(seconds: 5), () {
      log("Attempting to reconnect...");
      _connect();
    });
  }

  void sendMessage() {
    log(currentUserId.toString() + content.toString());
    log('--- Sending message... Checking conditions... ---');
    log('   Is connected? ${isConnected.value}');
    log('   Is content empty? ${content.text.isEmpty}');

    // // if (content.text.isEmpty || !isConnected.value || currentUserId == null) {
    //    log('--- ‼ SendMessage aborted. Conditions not met. ---');
    //    Get.snackbar(
    //      "Cannot Send Message",
    //      !isConnected.value
    //          ? "You are not connected to the chat service."
    //          : "Message cannot be empty.",
    //      snackPosition: SnackPosition.BOTTOM,
    //    );
    //    return;
    //  }

    final messageToSend = {
      'senderId': currentUserId,
      'content': content.text,
      'roomId': roomId,
    };

    stompClient?.send(
      destination: "/app/chat/send-message",
      body: jsonEncode(messageToSend),
    );
    log('--- DEBUG: messageToSend map ---');
    log('senderId: ${messageToSend['senderId']}');
    log('content: ${messageToSend['content']}');
    log('roomId: ${messageToSend['roomId']}');
    log('messageToSend = ${jsonEncode(messageToSend)}');
    messages.insert(
      0,
      Message(
        sender: UserModel(id: currentUserId!),
        content: content.text,
        createdAt: DateTime.now().toIso8601String(),
      ),
    );

    content.clear();
    log('--- Message sent and text field cleared. ---');
  }
}
