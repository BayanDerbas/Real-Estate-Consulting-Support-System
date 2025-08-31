import 'package:json_annotation/json_annotation.dart';

part 'report_category_model.g.dart';

@JsonSerializable()
class ReportCategory {
  final int id;
  final String title;

  ReportCategory({required this.id, required this.title});

  factory ReportCategory.fromJson(Map<String, dynamic> json) =>
      _$ReportCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ReportCategoryToJson(this);
}
