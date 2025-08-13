// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'working_times_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableTime _$WorkingTimeFromJson(Map<String, dynamic> json) =>
    AvailableTime(
      id: (json['id'] as num).toInt(),
      dayOfWeek: json['dayOfWeek'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      callType: json['callType'] as String?,
    );

Map<String, dynamic> _$WorkingTimeToJson(AvailableTime instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dayOfWeek': instance.dayOfWeek,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'callType': instance.callType,
    };
