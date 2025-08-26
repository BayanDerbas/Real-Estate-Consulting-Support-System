import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/chats/data/repository/chat_repository.dart';
import 'package:image_picker/image_picker.dart';
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

  final ScrollController scrollController = ScrollController();
  int page = 0;
  final int size = 15;
  var isFetchingMore = false.obs;
  var hasMore = true.obs;

  @override
  void onInit() {
    super.onInit();
    ever(messages, (_) {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (scrollController.hasClients) {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        }
      });
    });

    scrollController.addListener(() {
      if (scrollController.position.pixels <=
          scrollController.position.minScrollExtent + 100) {
        if (!isFetchingMore.value && hasMore.value) {
          loadMoreMessages();
        }
      }
    });
  }

  @override
  void onClose() {
    stompClient?.deactivate();
    content.dispose();
    scrollController.dispose();
    super.onClose();
  }

  Future<void> initializeChat() async {
    if (isConnected.value) return;
    isLoading.value = true;
    try {
      final storedId = await storage.getUserId();
      if (storedId == null) throw Exception('User ID not found');
      currentUserId = int.tryParse(storedId);
      if (roomId == null || otherUser.value == null || currentUserId == null) {
        throw Exception('Chat data missing');
      }
      page = 0;
      hasMore.value = true;
      await _fetchInitialMessages();
      _connect();
    } catch (e) {
      Get.snackbar('Error', 'Chat setup failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _fetchInitialMessages() async {
    final result = await chatRepository.getMessagesForCurrentRoom(
      id: roomId!,
      page: page,
      size: size,
    );
    result.fold((failure) {}, (initialMessages) {
      if (initialMessages.isEmpty) {
        hasMore.value = false;
      }
      messages.assignAll(initialMessages.reversed);
      Future.delayed(const Duration(milliseconds: 200), () {
        if (scrollController.hasClients) {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        }
      });
    });
  }

  Future<void> loadMoreMessages() async {
    if (!hasMore.value) return;
    isFetchingMore.value = true;
    page++;
    final result = await chatRepository.getMessagesForCurrentRoom(
      id: roomId!,
      page: page,
      size: size,
    );
    result.fold((failure) {}, (olderMessages) {
      if (olderMessages.isEmpty) {
        hasMore.value = false;
      } else {
        final oldScrollOffset = scrollController.position.pixels;
        messages.insertAll(0, olderMessages.reversed);
        Future.delayed(const Duration(milliseconds: 100), () {
          if (scrollController.hasClients) {
            scrollController.jumpTo(
              scrollController.position.maxScrollExtent - oldScrollOffset,
            );
          }
        });
      }
    });
    isFetchingMore.value = false;
  }

  void _connect() async {
    try {
      final token = await storage.getToken();
      stompClient = StompClient(
        config: StompConfig(
          url: 'ws://195.88.87.77:8000/chat',
          onConnect: (frame) {
            isConnected.value = true;
            stompClient?.subscribe(
              destination: "/topic/room/$roomId",
              callback: (frame) {
                if (frame.body != null) {
                  final newMessage = Message.fromJson(jsonDecode(frame.body!));

                  if (newMessage.sender?.id == currentUserId) {
                    final localIndex = messages.lastIndexWhere(
                      (m) =>
                          m.status != MessageStatus.delivered &&
                          m.content == newMessage.content,
                    );
                    if (localIndex != -1) {
                      messages[localIndex] = newMessage.copyWith(
                        status: MessageStatus.delivered,
                      );
                      return;
                    }
                  }

                  messages.add(newMessage.copyWith(status: MessageStatus.sent));
                }
              },
            );
          },
          onDisconnect: (_) {
            isConnected.value = false;
            _reconnect();
          },
          onWebSocketError: (_) {
            isConnected.value = false;
            _reconnect();
          },
          reconnectDelay: const Duration(seconds: 5),
          heartbeatIncoming: const Duration(seconds: 0),
          heartbeatOutgoing: const Duration(seconds: 0),
          stompConnectHeaders: {'Authorization': 'Bearer $token'},
        ),
      );
      stompClient?.activate();
    } catch (_) {
      isConnected.value = false;
      _reconnect();
    }
  }

  void _reconnect() {
    Future.delayed(const Duration(seconds: 5), () {
      _connect();
    });
  }

  void sendMessage() {
    if (content.text.isEmpty || currentUserId == null) return;

    final localMessage = Message(
      sender: UserModel(id: currentUserId!),
      content: content.text,
      createdAt: DateTime.now().toIso8601String(),
      status: MessageStatus.local,
    );

    messages.add(localMessage);

    final messageToSend = {
      'senderId': currentUserId,
      'content': content.text,
      'roomId': roomId,
    };

    stompClient?.send(
      destination: "/app/chat/send-message",
      body: jsonEncode(messageToSend),
    );

    final localIndex = messages.indexOf(localMessage);
    if (localIndex != -1) {
      messages[localIndex] = localMessage.copyWith(status: MessageStatus.sent);
    }

    content.clear();
  }

  void sendImage(String fileName, String fileType, Uint8List fileData) {
    if (currentUserId == null) return;

    final localMessage = Message(
      sender: UserModel(id: currentUserId!),
      createdAt: DateTime.now().toIso8601String(),
      status: MessageStatus.local,
      fileData: fileData,
    );

    messages.add(localMessage);

    final messageToSend = {
      'senderId': currentUserId,
      'roomId': roomId,
      'fileName': fileName,
      'fileType': fileType,
      'filaData': base64Encode(fileData),
    };

    stompClient?.send(
      destination: "/app/chat/send-file",
      body: jsonEncode(messageToSend),
    );

    final localIndex = messages.indexOf(localMessage);
    if (localIndex != -1) {
      messages[localIndex] = localMessage.copyWith(status: MessageStatus.sent);
    }

    content.clear();
  }

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      Uint8List image = await picked.readAsBytes();

      sendImage(picked.name, picked.path.split('.').last, image);
    }
  }
}
