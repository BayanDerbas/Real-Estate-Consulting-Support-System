// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_schedule_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleTimeRequest _$ScheduleTimeRequestFromJson(Map<String, dynamic> json) =>
    ScheduleTimeRequest(
      (json['id'] as num?)?.toInt(),
      json['day'] as String?,
      json['startTime'] as String?,
      json['endTime'] as String?,
      json['callType'] as String?,
    );

Map<String, dynamic> _$ScheduleTimeRequestToJson(
  ScheduleTimeRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'day': instance.day,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'callType': instance.callType,
};
