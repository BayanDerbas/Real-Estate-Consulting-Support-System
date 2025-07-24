// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_room_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRoomRequestModel _$CreateRoomRequestModelFromJson(
  Map<String, dynamic> json,
) => CreateRoomRequestModel(
  userId1: (json['userId1'] as num?)?.toInt(),
  userId2: (json['userId2'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreateRoomRequestModelToJson(
  CreateRoomRequestModel instance,
) => <String, dynamic>{
  'userId1': instance.userId1,
  'userId2': instance.userId2,
};
