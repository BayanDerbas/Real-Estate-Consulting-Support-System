// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfficeData _$OfficeDataFromJson(Map<String, dynamic> json) => OfficeData(
  content:
      (json['content'] as List<dynamic>)
          .map((e) => Office.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$OfficeDataToJson(OfficeData instance) =>
    <String, dynamic>{'content': instance.content};
