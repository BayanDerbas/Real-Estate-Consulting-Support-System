// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_of_current_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomsOfCurrentUser _$RoomsOfCurrentUserFromJson(Map<String, dynamic> json) =>
    RoomsOfCurrentUser(
      otherUser:
          json['otherUser'] == null
              ? null
              : UserModel.fromJson(json['otherUser'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$RoomsOfCurrentUserToJson(RoomsOfCurrentUser instance) =>
    <String, dynamic>{
      'otherUser': instance.otherUser,
      'id': instance.id,
      'createdAt': instance.createdAt,
    };
