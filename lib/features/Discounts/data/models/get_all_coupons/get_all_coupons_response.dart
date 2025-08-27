import 'package:json_annotation/json_annotation.dart';
import 'get_all_coupons_data.dart';

part 'get_all_coupons_response.g.dart';

@JsonSerializable()
class GetAllCouponsResponse {
  final String? status;
  final List<GetAllCouponsData>? data;

  GetAllCouponsResponse({required this.status, required this.data});

  factory GetAllCouponsResponse.fromJson(Map<String,dynamic> json) => _$GetAllCouponsResponseFromJson(json);
  Map<String,dynamic> toJson() => _$GetAllCouponsResponseToJson(this);
}