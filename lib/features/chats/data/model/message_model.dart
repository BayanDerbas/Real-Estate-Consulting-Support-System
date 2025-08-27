import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';
import '../../../Auth/data/model/user_model.dart';

part 'message_model.g.dart';

enum MessageStatus { local, sent, delivered }

@JsonSerializable()
class Message {
  final int? id;
  final UserModel? sender;
  final String? content;
  final String? createdAt;

  final String? fileName;
  final String? fileType;
  final String? fileUrl;
  //final Uint8List? fileData;
  @JsonKey(ignore: true)
  final Uint8List? fileData;
  //if i use converter:
  // @Uint8ListConverter()
  // final Uint8List? fileData;

  @JsonKey(ignore: true)
  final MessageStatus status;

  Message({
    this.fileName,
    this.fileType,
    this.fileUrl,
    this.id,
    this.sender,
    this.content,
    this.createdAt,
    this.fileData,
    this.status = MessageStatus.sent,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  Message copyWith({
    int? id,
    UserModel? sender,
    String? content,
    String? createdAt,
    MessageStatus? status,
  }) {
    return Message(
      id: id ?? this.id,
      sender: sender ?? this.sender,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
    );
  }
}


//using converter:
// class Uint8ListConverter implements JsonConverter<Uint8List?, String?> {
//   const Uint8ListConverter();
//
//   @override
//   Uint8List? fromJson(String? json) {
//     if (json == null) return null;
//     try {
//       return base64Decode(json);
//     } catch (_) {
//       return null;
//     }
//   }
//
//   @override
//   String? toJson(Uint8List? object) {
//     if (object == null) return null;
//     return base64Encode(object);
//   }
// }