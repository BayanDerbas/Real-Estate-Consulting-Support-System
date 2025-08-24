// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_coupons_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCouponsResponse _$CreateCouponsResponseFromJson(
  Map<String, dynamic> json,
) => CreateCouponsResponse(
  json['status'] as String?,
  json['data'] == null
      ? null
      : CreateCouponsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateCouponsResponseToJson(
  CreateCouponsResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
