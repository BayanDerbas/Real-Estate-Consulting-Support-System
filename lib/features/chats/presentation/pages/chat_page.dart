import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';
import '../wedgits/custom_message.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  final controller = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            "${controller.otherUser.value?.firstName ?? ''} ${controller.otherUser.value?.lastName ?? ''}"
                    .trim()
                    .isEmpty
                ? 'Chat'.tr
                : "${controller.otherUser.value?.firstName ?? ''} ${controller.otherUser.value?.lastName ?? ''}"
                    .trim(),
          ),
        ),
        centerTitle: true,
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
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages[index];
                  final isMe = message.sender?.id == controller.currentUserId;
                  return MessageBubble(
                    message: message.content ?? '',
                    isMe: isMe,
                  );
                },
              );
            }),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.content,
              decoration: InputDecoration(
                hintText: 'Type a message...'.tr,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
              onSubmitted: (_) => controller.sendMessage(),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 24,
            backgroundColor: Get.theme.primaryColor,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () => controller.sendMessage(),
            ),
          ),
        ],
      ),
    );
  }
}
