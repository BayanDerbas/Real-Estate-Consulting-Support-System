// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_coupons_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCouponsData _$GetAllCouponsDataFromJson(Map<String, dynamic> json) =>
    GetAllCouponsData(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      description: json['description'] as String?,
      discountType: json['discountType'] as String?,
      discountValue: (json['discountValue'] as num?)?.toInt(),
      expirationDate: json['expirationDate'] as String?,
      maxUses: (json['maxUses'] as num?)?.toInt(),
      timesUsed: (json['timesUsed'] as num?)?.toInt(),
      isActive: json['isActive'] as bool?,
      expertId: (json['expertId'] as num?)?.toInt(),
      expertName: json['expertName'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$GetAllCouponsDataToJson(GetAllCouponsData instance) =>
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
