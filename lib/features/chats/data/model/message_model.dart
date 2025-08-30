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

  @JsonKey(ignore: true)
  final MessageStatus status;
  final String? fileName;
  final String? fileType;
  final String? fileUrl;
  // final Uint8List? fileData;
  //
  // @JsonKey(ignore: true)
  // final MessageStatus status;

  Message( {
    this.id,
    this.sender,
    this.content,
    this.createdAt,
    this.status = MessageStatus.sent,
    this.fileName,
    this.fileType,
    this.fileUrl,
    // this.status = MessageStatus.sent,
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
