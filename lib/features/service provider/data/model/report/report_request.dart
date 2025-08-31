import 'package:json_annotation/json_annotation.dart';

part 'report_request.g.dart';

@JsonSerializable()
class ReportRequest {
  final int categoryId;
  final String description;
  final int reportedUserId;

  ReportRequest({
    required this.categoryId,
    required this.description,
    required this.reportedUserId,
  });

  factory ReportRequest.fromJson(Map<String, dynamic> json) => _$ReportRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ReportRequestToJson(this);
}
