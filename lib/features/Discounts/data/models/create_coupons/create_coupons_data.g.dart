// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_coupons_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCouponsData _$CreateCouponsDataFromJson(Map<String, dynamic> json) =>
    CreateCouponsData(
      (json['id'] as num?)?.toInt(),
      json['code'] as String?,
      json['description'] as String?,
      json['discountType'] as String?,
      (json['discountValue'] as num?)?.toDouble(),
      json['expirationDate'] as String?,
      (json['maxUses'] as num?)?.toInt(),
      (json['timesUsed'] as num?)?.toInt(),
      json['isActive'] as bool?,
      (json['expertId'] as num).toInt(),
      json['expertName'] as String?,
      json['createdAt'] as String?,
    );

Map<String, dynamic> _$CreateCouponsDataToJson(CreateCouponsData instance) =>
    <String, dynamic>{
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
