// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportResponseModel _$ReportResponseModelFromJson(Map<String, dynamic> json) =>
    ReportResponseModel(
      status: json['status'] as String?,
      data:
          json['data'] == null
              ? null
              : ReportData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportResponseModelToJson(
  ReportResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

ReportData _$ReportDataFromJson(Map<String, dynamic> json) => ReportData(
  id: (json['id'] as num?)?.toInt(),
  reporterUser: json['reporterUser'],
  reportedUser: json['reportedUser'],
  category: json['category'],
  description: json['description'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$ReportDataToJson(ReportData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reporterUser': instance.reporterUser,
      'reportedUser': instance.reportedUser,
      'category': instance.category,
      'description': instance.description,
      'createdAt': instance.createdAt,
    };
