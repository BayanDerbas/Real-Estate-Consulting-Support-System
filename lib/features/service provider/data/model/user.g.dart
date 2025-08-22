// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num?)?.toInt(),
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  fcmToken: json['fcmToken'] as String?,
  enabled: json['enabled'] as bool?,
  role: json['role'] as String?,
  status: json['status'] as String?,
  imageUrl: json['imageUrl'] as String?,
  warnsCount: (json['warnsCount'] as num?)?.toInt(),
  blocksCount: (json['blocksCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phone': instance.phone,
  'fcmToken': instance.fcmToken,
  'enabled': instance.enabled,
  'role': instance.role,
  'status': instance.status,
  'imageUrl': instance.imageUrl,
  'warnsCount': instance.warnsCount,
  'blocksCount': instance.blocksCount,
};
