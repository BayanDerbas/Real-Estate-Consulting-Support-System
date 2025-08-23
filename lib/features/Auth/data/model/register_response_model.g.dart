// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseModel _$RegisterResponseModelFromJson(
  Map<String, dynamic> json,
) => RegisterResponseModel(
  status: json['status'] as String?,
  data:
      json['data'] == null
          ? null
          : UserRegisterData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RegisterResponseModelToJson(
  RegisterResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

UserRegisterData _$UserRegisterDataFromJson(Map<String, dynamic> json) =>
    UserRegisterData(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      warnsCount: (json['warnsCount'] as num?)?.toInt(),
      blocksCount: (json['blocksCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserRegisterDataToJson(UserRegisterData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'warnsCount': instance.warnsCount,
      'blocksCount': instance.blocksCount,
    };
