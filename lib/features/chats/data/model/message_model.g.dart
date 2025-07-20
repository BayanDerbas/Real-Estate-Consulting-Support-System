// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
  id: (json['id'] as num).toInt(),
  sender: UserModel.fromJson(json['sender'] as Map<String, dynamic>),
  content: json['content'] as String,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
  'id': instance.id,
  'sender': instance.sender,
  'content': instance.content,
  'createdAt': instance.createdAt,
};
