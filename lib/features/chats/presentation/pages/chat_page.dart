import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/chat_controller.dart';
import '../wedgits/custom_message.dart';

class UserChatPage extends StatelessWidget {
  UserChatPage({super.key});

  final ChatController controller = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        leading: const BackButton(color: Colors.white),
        title: Obx(() {
          final user = controller.otherUser.value;
          if (user == null) {
            return const Text(
              "Loading Chat...",
              style: TextStyle(color: Colors.white),
            );
          }
          return Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    (user.imageUrl != null && user.imageUrl!.isNotEmpty)
                        ? NetworkImage(user.imageUrl!)
                        : null,
                backgroundColor: Colors.teal[700],
                child:
                    (user.imageUrl == null || user.imageUrl!.isEmpty)
                        ? const Icon(
                          Icons.person,
                          size: 22,
                          color: Colors.white,
                        )
                        : null,
                radius: 18,
              ),
              const SizedBox(width: 8),
              Text(
                user.firstName!,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          );
        }),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                reverse: true,
                padding: const EdgeInsets.all(12),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages.reversed.toList()[index];
                  final isMe = message.sender.id == controller.currentUserId;

                  return ChatBubble(
                    text: message.content,
                    alignment:
                        isMe ? Alignment.centerRight : Alignment.centerLeft,
                    backgroundColor:
                        isMe ? Colors.purple : Colors.grey.shade200,
                    textColor: isMe ? Colors.white : Colors.black87,
                  );
                },
              );
            }),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: const Border(top: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.content,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: controller.sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
