// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verificationcode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationCodeModel _$VerificationCodeModelFromJson(
  Map<String, dynamic> json,
) => VerificationCodeModel(
  email: json['email'] as String?,
  verificationCode: json['verificationCode'] as String?,
);

Map<String, dynamic> _$VerificationCodeModelToJson(
  VerificationCodeModel instance,
) => <String, dynamic>{
  'verificationCode': instance.verificationCode,
  'email': instance.email,
};
