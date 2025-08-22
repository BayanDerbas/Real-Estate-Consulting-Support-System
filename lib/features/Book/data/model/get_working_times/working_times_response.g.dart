// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'working_times_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkingTimesResponse _$WorkingTimesResponseFromJson(
  Map<String, dynamic> json,
) => WorkingTimesResponse(
  json['status'] as String?,
  (json['data'] as List<dynamic>?)
      ?.map((e) => WorkingTimesData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WorkingTimesResponseToJson(
  WorkingTimesResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
