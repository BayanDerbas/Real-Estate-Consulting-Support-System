// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offices_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfficesResponse _$OfficesResponseFromJson(Map<String, dynamic> json) =>
    OfficesResponse(
      status: json['status'] as String,
      data: OfficeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OfficesResponseToJson(OfficesResponse instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};
