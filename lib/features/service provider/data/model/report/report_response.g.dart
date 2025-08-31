// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportResponse _$ReportResponseFromJson(Map<String, dynamic> json) =>
    ReportResponse(
      json['status'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => ReportCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReportResponseToJson(ReportResponse instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};
