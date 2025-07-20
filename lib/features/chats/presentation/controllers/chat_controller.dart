// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:graduation_project/core/utils/secure_storage.dart';
// import 'package:graduation_project/features/chats/data/repository/chat_repository.dart';
// import 'package:stomp_dart_client/stomp_dart_client.dart';
// import '../../../Auth/data/model/user_model.dart';
// import '../../data/model/message_model.dart';
//
// class ChatController extends GetxController {
//   final ChatRepository chatRepository;
//   final SecureStorage storage = SecureStorage();
//
//   ChatController(this.chatRepository);
//
//   final content = TextEditingController();
//   var messages = <Message>[].obs;
//   var isLoading = true.obs;
//   var isConnected = false.obs;
//
//   late int roomId;
//   late UserModel otherUser;
//   int? currentUserId;
//
//   late StompClient stompClient;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _extractArguments();
//   }
//
//   void _extractArguments() {
//     if (Get.arguments is Map<String, dynamic>) {
//       final args = Get.arguments as Map<String, dynamic>;
//       roomId = args['roomId'];
//       otherUser = args['otherUser'];
//     } else {
//       Get.back();
//       Get.snackbar('Error', 'Failed to load chat data.');
//     }
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//     _initializeChat();
//   }
//
//   Future<void> _initializeChat() async {
//     isLoading.value = true;
//     try {
//       final storedId = await storage.getUserId();
//       if (storedId == null) {
//         throw Exception('Authentication error: User not found.');
//       }
//       currentUserId = int.tryParse(storedId);
//
//       await _fetchInitialMessages();
//       _connectAndSubscribe();
//     } catch (e) {
//       log("Initialization failed: $e");
//       Get.snackbar('Error', 'An unexpected error occurred during chat setup.');
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   Future<void> _fetchInitialMessages() async {
//     final messagesResult = await chatRepository.getMessagesForCurrentRoom(
//       roomId: roomId,
//       page: 0,
//       size: 50,
//     );
//     messagesResult.fold(
//       (failure) {
//         log("Failed to fetch initial messages: ${failure.err_message}");
//         Get.snackbar('Error', 'Could not load previous messages.');
//       },
//       (initialMessages) {
//         messages.assignAll(initialMessages.reversed);
//       },
//     );
//   }
//
//   void _connectAndSubscribe() async {
//     final userToken = await storage.getToken();
//
//     stompClient = StompClient(
//       config: StompConfig(
//         url: 'ws://192.168.43.58:8080/chat',
//         onConnect: (frame) {
//           isConnected.value = true;
//           log("STOMP client connected");
//           stompClient.subscribe(
//             destination: "/topic/room/$roomId",
//             callback: (frame) {
//               if (frame.body != null) {
//                 try {
//                   final newMessage = Message.fromJson(jsonDecode(frame.body!));
//                   messages.insert(0, newMessage);
//                 } catch (e) {
//                   log("Error parsing message: $e");
//                 }
//               }
//             },
//           );
//         },
//         onDisconnect: (frame) => isConnected.value = false,
//         onWebSocketError: (error) => isConnected.value = false,
//         heartbeatIncoming: Duration(seconds: 0),
//         heartbeatOutgoing: Duration(seconds: 0),
//         stompConnectHeaders: {'Authorization': userToken ?? ''},
//         //webSocketConnectHeaders: {'Authorization': userToken ?? ''},
//       ),
//     );
//     stompClient.activate();
//   }
//
//   void sendMessage() {
//     if (content.text.isEmpty || !isConnected.value) {
//       return;
//     }
//
//     final sender = UserModel(id: currentUserId!);
//     final messageToSend = {
//       'senderId': currentUserId,
//       'content': content.text,
//       'roomId': roomId,
//     };
//
//     stompClient.send(
//       destination: "/app/chat/send-message",
//       body: jsonEncode(messageToSend),
//     );
//
//     final optimisticMessage = Message(
//       id: DateTime.now().millisecondsSinceEpoch,
//       sender: sender,
//       content: content.text,
//       createdAt: DateTime.now().toIso8601String(),
//     );
//     messages.insert(0, optimisticMessage);
//     content.clear();
//   }
//
//   @override
//   void onClose() {
//     log("Deactivating STOMP client for room $roomId");
//     stompClient.deactivate();
//     content.dispose();
//     super.onClose();
//   }
// }
