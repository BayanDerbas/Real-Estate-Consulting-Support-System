// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportRequest _$ReportRequestFromJson(Map<String, dynamic> json) =>
    ReportRequest(
      categoryId: (json['categoryId'] as num).toInt(),
      description: json['description'] as String,
      reportedUserId: (json['reportedUserId'] as num).toInt(),
    );

Map<String, dynamic> _$ReportRequestToJson(ReportRequest instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'description': instance.description,
      'reportedUserId': instance.reportedUserId,
    };
