import 'package:json_annotation/json_annotation.dart';
import 'office.dart';

part 'office_data.g.dart';

@JsonSerializable()
class OfficeData {
  final List<Office>? content;
  final Pageable? pageable;
  final int? totalPages;

  OfficeData({this.content, this.pageable, this.totalPages});

  factory OfficeData.fromJson(Map<String, dynamic> json) =>
      _$OfficeDataFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeDataToJson(this);
}

@JsonSerializable()
class Pageable {
  final int? pageNumber;

  Pageable({this.pageNumber});

  factory Pageable.fromJson(Map<String, dynamic> json) =>
      _$PageableFromJson(json);
  Map<String, dynamic> toJson() => _$PageableToJson(this);
}
