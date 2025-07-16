import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/networks/api_constant.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

import '../../data/model/message_model.dart';
import '../../data/model/sender_model.dart';

class ChatController extends GetxController {
  TextEditingController content = TextEditingController();
  final SecureStorage storage = SecureStorage();
  var messages = <MessageModel>[].obs;
  late StompClient stompClient;
  var isConnected = false.obs;

  @override
  void onInit() {
    _connect();
    super.onInit();
  }

  void _connect() async {
    final userToken = await storage.getToken();
    try {
      stompClient = StompClient(
        config: StompConfig(
          url: ApiConstant.baseUrlSocket,
          onConnect: (StompFrame frame) {
            isConnected.value = true;
            log("Connected to WebSocket");

            stompClient.subscribe(
              destination: "/topic/room/1",
              callback: (StompFrame frame) {
                if (frame.body != null) {
                  try {
                    log(frame.body.toString());
                    final newMessage = MessageModel.fromJson(
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
          stompConnectHeaders: {'Authorization': userToken!}, //
        ),
      );

      stompClient.activate();
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
    if (content.text.isEmpty) return;

    if (!isConnected.value) {
      Get.snackbar('Error', 'No active connection. Trying to reconnect...');
      _connect();
      return;
    }

    try {
      final message = MessageModel(
        sender: SenderModel(id: 2),
        content: content.text,
        roomId: 1,
      );

      stompClient.send(
        destination: "/app/chat/send-message",
        body: jsonEncode(message.toJson()),
      );

      content.clear();
      log("Message sent successfully");
    } catch (e) {
      log("Error sending message: $e");
      Get.snackbar('Error', 'Failed to send message: $e');
      isConnected.value = false;
      _reconnect();
    }
  }

  @override
  void dispose() {
    stompClient.deactivate();
    content.dispose();
    super.dispose();
  }
}
