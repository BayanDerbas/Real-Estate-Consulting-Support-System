import 'package:json_annotation/json_annotation.dart';

part 'show_expert_coupons_data.g.dart';

@JsonSerializable()
class ShowExpertCouponsData {
  final int? id;
  final String? code;
  final String? description;
  final String? discountType;
  final int? discountValue;
  final String? expirationDate;
  final int? maxUses;
  final int? timesUsed;
  final bool? isActive;
  final int? expertId;
  final String? expertName;
  final String? createdAt;

  ShowExpertCouponsData(
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

  factory ShowExpertCouponsData.fromJson(Map<String,dynamic> json) => _$ShowExpertCouponsDataFromJson(json);
  Map<String,dynamic> toJson() => _$ShowExpertCouponsDataToJson(this);
}
