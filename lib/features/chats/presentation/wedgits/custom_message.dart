import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Alignment alignment;
  final double maxWidth;

  const ChatBubble({
    super.key,
    required this.text,
    this.backgroundColor = Colors.purple,
    this.textColor = Colors.white,
    this.alignment = Alignment.centerRight,
    this.maxWidth = 250.0,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}
