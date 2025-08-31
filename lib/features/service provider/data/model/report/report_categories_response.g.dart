// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportCategoriesResponse _$ReportCategoriesResponseFromJson(
  Map<String, dynamic> json,
) => ReportCategoriesResponse(
  status: json['status'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => ReportCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ReportCategoriesResponseToJson(
  ReportCategoriesResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
