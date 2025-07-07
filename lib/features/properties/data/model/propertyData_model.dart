import 'package:json_annotation/json_annotation.dart';
import 'property_model.dart';

part 'propertyData_model.g.dart';

@JsonSerializable()
class PropertyData {
  final List<PropertyModel> content;

  PropertyData({required this.content});

  factory PropertyData.fromJson(Map<String, dynamic> json) =>
      _$PropertyDataFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyDataToJson(this);
}