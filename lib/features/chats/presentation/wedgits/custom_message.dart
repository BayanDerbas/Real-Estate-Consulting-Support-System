import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const MessageBubble({super.key, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    // Use a Row to control the horizontal alignment of the bubble.
    return Row(
      // If the message is from 'me', align it to the right (end).
      // Otherwise, align it to the left (start).
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        // Use a flexible container to ensure the bubble doesn't overflow
        // the screen width if the message is very long.
        Flexible(
          child: Container(
            // Set the decoration for the bubble's appearance.
            decoration: BoxDecoration(
              // Use different colors based on who sent the message.
              // You can easily change these colors to match your app's theme.
              color: isMe ? Theme.of(context).primaryColor : Colors.grey[300],

              // Apply rounded corners to the bubble.
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                // The bottom corner on the sender's side is not rounded,
                // giving it a classic chat bubble "tail" look.
                bottomLeft:
                    isMe ? const Radius.circular(16) : const Radius.circular(0),
                bottomRight:
                    isMe ? const Radius.circular(0) : const Radius.circular(16),
              ),
            ),

            // Add padding inside the bubble for the text.
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),

            // Add margin outside the bubble for spacing between messages.
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),

            // The actual message text.
            child: Text(
              message,
              // Use different text colors for better readability on the bubble's background.
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black87,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
