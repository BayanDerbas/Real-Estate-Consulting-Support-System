import 'package:json_annotation/json_annotation.dart';
import 'report_category_model.dart';

part 'report_categories_response.g.dart';

@JsonSerializable()
class ReportCategoriesResponse {
  final String? status;
  final List<ReportCategory>? data;

  ReportCategoriesResponse({this.status, this.data});

  factory ReportCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportCategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReportCategoriesResponseToJson(this);
}
