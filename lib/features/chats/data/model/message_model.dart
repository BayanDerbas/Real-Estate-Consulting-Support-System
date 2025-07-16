import 'package:graduation_project/features/chats/data/model/sender_model.dart';

class MessageModel {
  final SenderModel? sender;
  final int? roomId;
  final String? content;

  MessageModel({this.sender, this.content, this.roomId});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      sender: SenderModel.fromJson(json["sender"]),
      content: json["content"],
      roomId: json["roomId"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "senderId": sender!.id ?? 1,
      "content": content ?? "",
      "roomId": roomId,
    };
  }
}
