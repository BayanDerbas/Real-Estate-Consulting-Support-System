// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_room_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRoomResponseModel _$CreateRoomResponseModelFromJson(
  Map<String, dynamic> json,
) => CreateRoomResponseModel(
  user1: UserModel.fromJson(json['user1'] as Map<String, dynamic>),
  user2: UserModel.fromJson(json['user2'] as Map<String, dynamic>),
  roomKey: json['roomKey'] as String,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$CreateRoomResponseModelToJson(
  CreateRoomResponseModel instance,
) => <String, dynamic>{
  'user1': instance.user1,
  'user2': instance.user2,
  'roomKey': instance.roomKey,
  'createdAt': instance.createdAt,
};
