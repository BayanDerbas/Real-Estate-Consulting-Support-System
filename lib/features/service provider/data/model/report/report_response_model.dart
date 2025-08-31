import 'package:json_annotation/json_annotation.dart';

part 'report_response_model.g.dart';

@JsonSerializable()
class ReportResponseModel {
  final String? status;
  final ReportData? data;

  ReportResponseModel({this.status, this.data});

  factory ReportResponseModel.fromJson(Map<String, dynamic> json) => _$ReportResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReportResponseModelToJson(this);
}

@JsonSerializable()
class ReportData {
  final int? id;
  final dynamic reporterUser;
  final dynamic reportedUser;
  final dynamic category;
  final String? description;
  final String? createdAt;

  ReportData({
    this.id,
    this.reporterUser,
    this.reportedUser,
    this.category,
    this.description,
    this.createdAt,
  });

  factory ReportData.fromJson(Map<String, dynamic> json) => _$ReportDataFromJson(json);
  Map<String, dynamic> toJson() => _$ReportDataToJson(this);
}
