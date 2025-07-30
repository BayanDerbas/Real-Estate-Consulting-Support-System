import 'package:json_annotation/json_annotation.dart';
import 'office_data.dart';

part 'offices_response.g.dart';

@JsonSerializable()
class OfficesResponse {
  final String? status;
  final OfficeData? data;

  OfficesResponse({this.status, this.data});

  factory OfficesResponse.fromJson(Map<String, dynamic> json) =>
      _$OfficesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OfficesResponseToJson(this);
}
