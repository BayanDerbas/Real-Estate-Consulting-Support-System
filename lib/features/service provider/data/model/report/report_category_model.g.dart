// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportCategory _$ReportCategoryFromJson(Map<String, dynamic> json) =>
    ReportCategory(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$ReportCategoryToJson(ReportCategory instance) =>
    <String, dynamic>{'id': instance.id, 'title': instance.title};
