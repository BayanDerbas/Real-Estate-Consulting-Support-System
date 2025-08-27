// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_coupons_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCouponsResponse _$GetAllCouponsResponseFromJson(
  Map<String, dynamic> json,
) => GetAllCouponsResponse(
  status: json['status'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => GetAllCouponsData.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$GetAllCouponsResponseToJson(
  GetAllCouponsResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
