import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';
import '../../data/model/message_model.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final MessageStatus status;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isMe,
    this.status = MessageStatus.sent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: isMe ? AppColors.purple : AppColors.lightGrey,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft:
                    isMe ? const Radius.circular(16) : const Radius.circular(0),
                bottomRight:
                    isMe ? const Radius.circular(0) : const Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    message,
                    style: TextStyle(
                      color: isMe ? AppColors.pureWhite : AppColors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
                if (isMe) ...[
                  const SizedBox(width: 5),
                  Icon(
                    status == MessageStatus.local
                        ? Icons.access_time
                        : status == MessageStatus.sent
                        ? Icons.check
                        : Icons.done_all,
                    size: 16,
                    color:
                        status == MessageStatus.delivered
                            ? Colors.blue
                            : Colors.grey,
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
