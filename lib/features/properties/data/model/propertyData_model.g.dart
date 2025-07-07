// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'propertyData_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyData _$PropertyDataFromJson(Map<String, dynamic> json) => PropertyData(
  content:
      (json['content'] as List<dynamic>)
          .map((e) => PropertyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$PropertyDataToJson(PropertyData instance) =>
    <String, dynamic>{'content': instance.content};
