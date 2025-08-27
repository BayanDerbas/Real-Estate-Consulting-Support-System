import 'package:json_annotation/json_annotation.dart';

part 'get_all_coupons_data.g.dart';

@JsonSerializable()
class GetAllCouponsData {
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

  factory GetAllCouponsData.fromJson(Map<String, dynamic> json) =>
      _$GetAllCouponsDataFromJson(json);

  GetAllCouponsData({
    required this.id,
    required this.code,
    required this.description,
    required this.discountType,
    required this.discountValue,
    required this.expirationDate,
    required this.maxUses,
    required this.timesUsed,
    required this.isActive,
    required this.expertId,
    required this.expertName,
    required this.createdAt,
  });
  Map<String, dynamic> toJson() => _$GetAllCouponsDataToJson(this);
}
