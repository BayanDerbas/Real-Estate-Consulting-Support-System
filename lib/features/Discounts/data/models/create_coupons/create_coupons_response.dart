import 'package:graduation_project/features/Discounts/data/models/create_coupons/create_coupons_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_coupons_response.g.dart';

@JsonSerializable()
class CreateCouponsResponse{
  final String? status;
  final CreateCouponsData? data;

  CreateCouponsResponse(this.status, this.data);
  factory CreateCouponsResponse.fromJson(Map<String,dynamic> json) => _$CreateCouponsResponseFromJson(json);
  Map<String,dynamic> toJson() => _$CreateCouponsResponseToJson(this);
}