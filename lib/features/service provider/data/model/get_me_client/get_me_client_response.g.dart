// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_me_client_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMeResponse _$GetMeResponseFromJson(Map<String, dynamic> json) =>
    GetMeResponse(
      id: (json['id'] as num?)?.toInt(),
      user:
          json['user'] == null
              ? null
              : GetMeUser.fromJson(json['user'] as Map<String, dynamic>),
      favorites:
          (json['favorites'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      followers:
          (json['followers'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GetMeResponseToJson(GetMeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'favorites': instance.favorites,
      'followers': instance.followers,
    };

GetMeUser _$GetMeUserFromJson(Map<String, dynamic> json) => GetMeUser(
  id: (json['id'] as num?)?.toInt(),
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String?,
  status: json['status'] as String?,
  imageUrl: json['imageUrl'] as String?,
  warnsCount: (json['warnsCount'] as num?)?.toInt(),
  blocksCount: (json['blocksCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$GetMeUserToJson(GetMeUser instance) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phone': instance.phone,
  'role': instance.role,
  'status': instance.status,
  'imageUrl': instance.imageUrl,
  'warnsCount': instance.warnsCount,
  'blocksCount': instance.blocksCount,
};
