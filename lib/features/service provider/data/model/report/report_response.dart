import 'package:json_annotation/json_annotation.dart';
import 'report_category_model.dart';

part 'report_response.g.dart';

@JsonSerializable()
class ReportResponse {
  final String? status;
  final List<ReportCategory>? data;

  ReportResponse(this.status, this.data);

  factory ReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReportResponseToJson(this);
}
