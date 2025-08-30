import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/translation/locale_controller.dart';
import 'package:intl/intl.dart';
import 'package:translator/translator.dart';
import '../../data/model/message_model.dart';

class MessageBubble extends StatefulWidget {
  final Message message;
  final bool isMe;
  final MessageStatus status;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isMe,
    this.status = MessageStatus.sent,
  });

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  String? translatedText;
  bool isTranslating = false;

  final translator = GoogleTranslator();

  Future<void> _translateMessage() async {
    if (widget.message.content == null) return;
    setState(() {
      isTranslating = true;
    });

    try {
      final translation = await translator.translate(
        widget.message.content!,
        from: 'auto',
        to: Get.find<LanguageController>().currentLocale.value.languageCode,
      );

      setState(() {
        translatedText = translation.text;
      });
    } catch (e) {
      setState(() {
        translatedText = "Translation failed";
      });
    }
    setState(() {
      isTranslating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: context.width - (context.width * 0.2),
          ),
          decoration: BoxDecoration(
            color: widget.isMe ? AppColors.purple : AppColors.lightGrey,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.message.content != null)
                Text(
                  widget.message.content!,
                  style: TextStyle(
                    color: widget.isMe ? AppColors.pureWhite : AppColors.black,
                    fontSize: 15,
                  ),
                ),

              if (translatedText != null) ...[
                const SizedBox(height: 5),
                Text(
                  translatedText!,
                  style: TextStyle(
                    color: widget.isMe ? Colors.white : Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                  ),
                ),
              ],

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat.jm().format(
                      DateTime.parse(widget.message.createdAt ?? ""),
                    ),
                    style: GoogleFonts.itim(
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                  ),

                  if (widget.message.content != null)
                    IconButton(
                      icon:
                          isTranslating
                              ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                              : const Icon(
                                Icons.translate,
                                size: 18,
                                color: Colors.blue,
                              ),
                      onPressed: isTranslating ? null : _translateMessage,
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
