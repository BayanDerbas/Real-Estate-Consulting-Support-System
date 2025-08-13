// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_working_times_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowAvailableTimesResponse _$ShowAvailableTimesResponseFromJson(
  Map<String, dynamic> json,
) => ShowAvailableTimesResponse(
  status: json['status'] as String,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => AvailableTime.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ShowAvailableTimesResponseToJson(
  ShowAvailableTimesResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
