// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_wrapper_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginWrapperResponseModel _$LoginWrapperResponseModelFromJson(
  Map<String, dynamic> json,
) => LoginWrapperResponseModel(
  status: json['status'] as String?,
  data:
      json['data'] == null
          ? null
          : LoginResponseModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginWrapperResponseModelToJson(
  LoginWrapperResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
