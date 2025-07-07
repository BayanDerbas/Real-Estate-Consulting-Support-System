// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'propertyResponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyResponse _$PropertyResponseFromJson(Map<String, dynamic> json) =>
    PropertyResponse(
      status: json['status'] as String,
      data: PropertyData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertyResponseToJson(PropertyResponse instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};
