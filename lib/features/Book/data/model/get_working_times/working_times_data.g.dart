// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'working_times_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkingTimesData _$WorkingTimesDataFromJson(Map<String, dynamic> json) =>
    WorkingTimesData(
      (json['id'] as num?)?.toInt(),
      json['dayOfWeek'] as String?,
      json['startTime'] as String?,
      json['endTime'] as String?,
      json['callType'] as String?,
    );

Map<String, dynamic> _$WorkingTimesDataToJson(WorkingTimesData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dayOfWeek': instance.dayOfWeek,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'callType': instance.callType,
    };
