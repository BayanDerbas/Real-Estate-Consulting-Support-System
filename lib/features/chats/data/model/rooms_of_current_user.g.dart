// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_of_current_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomsOfCurrentUser _$RoomsOfCurrentUserFromJson(Map<String, dynamic> json) =>
    RoomsOfCurrentUser(
      otherUser: UserModel.fromJson(json['otherUser'] as Map<String, dynamic>),
      roomKey: json['roomKey'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$RoomsOfCurrentUserToJson(RoomsOfCurrentUser instance) =>
    <String, dynamic>{
      'otherUser': instance.otherUser,
      'roomKey': instance.roomKey,
      'createdAt': instance.createdAt,
    };
