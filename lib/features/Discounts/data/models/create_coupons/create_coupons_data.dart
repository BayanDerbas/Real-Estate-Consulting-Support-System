import 'package:json_annotation/json_annotation.dart';

part 'create_coupons_data.g.dart';

@JsonSerializable()
class CreateCouponsData {
  final int? id;
  final String? code;
  final String? description;
  final String? discountType;
  final double? discountValue;
  final String? expirationDate;
  final int? maxUses;
  final int? timesUsed;
  final bool? isActive;
  final int expertId;
  final String? expertName;
  final String? createdAt;

  CreateCouponsData(
    this.id,
    this.code,
    this.description,
    this.discountType,
    this.discountValue,
    this.expirationDate,
    this.maxUses,
    this.timesUsed,
    this.isActive,
    this.expertId,
    this.expertName,
    this.createdAt,
  );

  factory CreateCouponsData.fromJson(Map<String,dynamic> json) => _$CreateCouponsDataFromJson(json);
  Map<String,dynamic> toJson() => _$CreateCouponsDataToJson(this);
}
