import 'package:json_annotation/json_annotation.dart';
import 'propertyData_model.dart';

part 'propertyResponse_model.g.dart';

@JsonSerializable()
class PropertyResponse {
  final String status;
  final PropertyData data;

  PropertyResponse({required this.status, required this.data});

  factory PropertyResponse.fromJson(Map<String, dynamic> json) =>
      _$PropertyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyResponseToJson(this);
}