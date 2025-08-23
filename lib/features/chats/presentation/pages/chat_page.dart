import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import '../controllers/chat_controller.dart';
import '../controllers/room_controller.dart';
import '../wedgits/custom_message.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  final controller = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'delete') {
                Get.dialog(
                  AlertDialog(
                    title: const Text('Delete Room'),
                    content: const Text(
                      'Are you sure you want to delete this chat?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.find<RoomController>().deleteCurrentRoom(
                            controller.roomId!,
                          );
                        },
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  barrierDismissible: false,
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(value: 'delete', child: Text('Delete')),
                const PopupMenuItem(value: 'report', child: Text('Report')),
              ];
            },
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: AppColors.pureWhite),
        ),
        title: Obx(
          () => Text(
            "${controller.otherUser.value?.firstName ?? ''} ${controller.otherUser.value?.lastName ?? ''}"
                    .trim()
                    .isEmpty
                ? 'Chat'.tr
                : "${controller.otherUser.value?.firstName ?? ''} ${controller.otherUser.value?.lastName ?? ''}"
                    .trim(),
            style: TextStyle(fontSize: 20, color: AppColors.pureWhite),
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.deepNavy,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                controller: controller.scrollController,
                itemCount:
                    controller.messages.length +
                    (controller.isFetchingMore.value ? 1 : 0),
                itemBuilder: (context, index) {
                  if (controller.isFetchingMore.value && index == 0) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  final messageIndex =
                      controller.isFetchingMore.value ? index - 1 : index;
                  final message = controller.messages[messageIndex];
                  final isMe = message.sender?.id == controller.currentUserId;
                  return MessageBubble(
                    message: message.content ?? '',
                    isMe: isMe,
                    status: message.status,
                  );
                },
              );
            }),
          ),
          Padding(
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
          ),
        ],
      ),
    );
  }
}
