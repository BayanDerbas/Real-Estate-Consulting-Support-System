import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/translation/locale_controller.dart';
import 'package:graduation_project/core/utils/shard_prefs.dart';
import 'package:intl/intl.dart';
import '../../data/model/message_model.dart';

class MessageBubble extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Row(
          children: [
            if (!isMe)
              CircleAvatar(
                backgroundImage:
                    message.sender?.imageUrl != null ||
                            message.sender?.imageUrl == ''
                        ? NetworkImage(message.sender?.imageUrl ?? "")
                        : AssetImage(AppImages.user),
              ).paddingDirectional(EdgeInsetsDirectional.only(start: 8)),
            Container(
              constraints: BoxConstraints(maxWidth: context.width - 32),
              decoration: BoxDecoration(
                color: isMe ? AppColors.purple : AppColors.lightGrey,
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: const Radius.circular(16),
                  topStart: const Radius.circular(16),
                  bottomStart:
                      isMe
                          ? const Radius.circular(16)
                          : const Radius.circular(0),
                  bottomEnd:
                      isMe
                          ? const Radius.circular(0)
                          : const Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (message.content == null)
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              message.fileUrl != ''
                                  ? NetworkImage(message.fileUrl ?? "")
                                  : MemoryImage(message.fileData!),
                        ),
                      ),
                    ),

                  if (message.content != null)
                    Flexible(
                      child: Text(
                        message.content!,
                        style: TextStyle(
                          color: isMe ? AppColors.pureWhite : AppColors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  Text(
                    DateFormat.jm(
                      Get.find<LanguageController>()
                          .currentLocale
                          .value
                          .languageCode,
                    ).format(DateTime.parse(message.createdAt ?? "")),
                    style: GoogleFonts.itim(
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                  ).paddingDirectional(EdgeInsetsDirectional.only(start: 7)),
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
          ],
        ),
      ],
    );
  }
}
