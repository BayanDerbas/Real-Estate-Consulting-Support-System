// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']),
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      location: json['location'] as String?,
      profession: json['profession'] as String?,
      experience: json['experience'] as String?,
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'role': _$RoleEnumMap[instance.role],
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'location': instance.location,
      'profession': instance.profession,
      'experience': instance.experience,
      'bio': instance.bio,
    };

const _$RoleEnumMap = {
  Role.USER: 'USER',
  Role.OFFICE: 'OFFICE',
  Role.EXPERT: 'EXPERT',
};
