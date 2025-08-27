// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_schedule_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleTimeData _$ScheduleTimeDataFromJson(Map<String, dynamic> json) =>
    ScheduleTimeData(
      (json['id'] as num?)?.toInt(),
      json['dayOfWeek'] as String?,
      json['startTime'] as String?,
      json['endTime'] as String?,
      json['callType'] as String?,
    );

Map<String, dynamic> _$ScheduleTimeDataToJson(ScheduleTimeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dayOfWeek': instance.dayOfWeek,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'callType': instance.callType,
    };
