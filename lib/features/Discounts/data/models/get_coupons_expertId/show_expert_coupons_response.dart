import 'package:graduation_project/features/Discounts/data/models/get_coupons_expertId/show_expert_coupons_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'show_expert_coupons_response.g.dart';

@JsonSerializable()
class ShowExpertCouponsResponse{
  final String? status;
  final List<ShowExpertCouponsData>? data;

  ShowExpertCouponsResponse(this.status, this.data);

  factory ShowExpertCouponsResponse.fromJson(Map<String,dynamic> json) => _$ShowExpertCouponsResponseFromJson(json);
  Map<String,dynamic> toJson() => _$ShowExpertCouponsResponseToJson(this);
}