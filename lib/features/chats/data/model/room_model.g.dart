// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomModel _$ChatRoomModelFromJson(Map<String, dynamic> json) =>
    ChatRoomModel(
      user1: UserModel.fromJson(json['user1'] as Map<String, dynamic>),
      user2: UserModel.fromJson(json['user2'] as Map<String, dynamic>),
      roomKey: json['roomKey'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ChatRoomModelToJson(ChatRoomModel instance) =>
    <String, dynamic>{
      'user1': instance.user1,
      'user2': instance.user2,
      'roomKey': instance.roomKey,
      'createdAt': instance.createdAt,
    };
