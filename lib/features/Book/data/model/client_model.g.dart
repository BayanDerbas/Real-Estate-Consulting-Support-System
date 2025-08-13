// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
  id: (json['id'] as num).toInt(),
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  favorites: _listFromJson(json['favorites']),
  following: _listFromJson(json['followers']),
);

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
  'id': instance.id,
  'user': instance.user,
  'favorites': instance.favorites,
  'followers': instance.following,
};
