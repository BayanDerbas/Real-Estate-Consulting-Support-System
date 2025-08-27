// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_expert_coupons_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowExpertCouponsData _$ShowExpertCouponsDataFromJson(
  Map<String, dynamic> json,
) => ShowExpertCouponsData(
  (json['id'] as num?)?.toInt(),
  json['code'] as String?,
  json['description'] as String?,
  json['discountType'] as String?,
  (json['discountValue'] as num?)?.toInt(),
  json['expirationDate'] as String?,
  (json['maxUses'] as num?)?.toInt(),
  (json['timesUsed'] as num?)?.toInt(),
  json['isActive'] as bool?,
  (json['expertId'] as num?)?.toInt(),
  json['expertName'] as String?,
  json['createdAt'] as String?,
);

Map<String, dynamic> _$ShowExpertCouponsDataToJson(
  ShowExpertCouponsData instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'description': instance.description,
  'discountType': instance.discountType,
  'discountValue': instance.discountValue,
  'expirationDate': instance.expirationDate,
  'maxUses': instance.maxUses,
  'timesUsed': instance.timesUsed,
  'isActive': instance.isActive,
  'expertId': instance.expertId,
  'expertName': instance.expertName,
  'createdAt': instance.createdAt,
};
