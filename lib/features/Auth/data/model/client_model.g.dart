// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientModel _$ClientModelFromJson(Map<String, dynamic> json) => ClientModel(
  id: (json['id'] as num).toInt(),
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
  favorites: json['favorites'] as List<dynamic>,
  following: json['following'] as List<dynamic>,
);

Map<String, dynamic> _$ClientModelToJson(ClientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'favorites': instance.favorites,
      'following': instance.following,
    };
