// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_expert_coupons_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowExpertCouponsResponse _$ShowExpertCouponsResponseFromJson(
  Map<String, dynamic> json,
) => ShowExpertCouponsResponse(
  json['status'] as String?,
  (json['data'] as List<dynamic>?)
      ?.map((e) => ShowExpertCouponsData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ShowExpertCouponsResponseToJson(
  ShowExpertCouponsResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
