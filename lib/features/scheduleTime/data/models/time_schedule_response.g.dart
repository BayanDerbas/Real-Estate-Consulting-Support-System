// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleTimeResponse _$ScheduleTimeResponseFromJson(
  Map<String, dynamic> json,
) => ScheduleTimeResponse(
  json['status'] as String?,
  (json['data'] as List<dynamic>?)
      ?.map((e) => ScheduleTimeData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ScheduleTimeResponseToJson(
  ScheduleTimeResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
