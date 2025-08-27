// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
  fileName: json['fileName'] as String?,
  fileType: json['fileType'] as String?,
  fileUrl: json['fileUrl'] as String?,
  id: (json['id'] as num?)?.toInt(),
  sender:
      json['sender'] == null
          ? null
          : UserModel.fromJson(json['sender'] as Map<String, dynamic>),
  content: json['content'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
  'id': instance.id,
  'sender': instance.sender,
  'content': instance.content,
  'createdAt': instance.createdAt,
  'fileName': instance.fileName,
  'fileType': instance.fileType,
  'fileUrl': instance.fileUrl,
};
