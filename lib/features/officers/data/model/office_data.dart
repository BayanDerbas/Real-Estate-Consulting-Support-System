import 'package:json_annotation/json_annotation.dart';
import 'office.dart';

part 'office_data.g.dart';

@JsonSerializable()
class OfficeData {
  final List<Office> content;

  OfficeData({required this.content});

  factory OfficeData.fromJson(Map<String, dynamic> json) =>
      _$OfficeDataFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeDataToJson(this);
}
