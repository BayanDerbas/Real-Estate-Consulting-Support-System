import 'package:json_annotation/json_annotation.dart';

part 'time_schedule_data.g.dart';

@JsonSerializable()
class ScheduleTimeData {
  final int? id;
  final String? dayOfWeek;
  final String? startTime;
  final String? endTime;
  final String? callType;

  ScheduleTimeData(
    this.id,
    this.dayOfWeek,
    this.startTime,
    this.endTime,
    this.callType,
  );
  factory ScheduleTimeData.fromJson(Map<String,dynamic> json) => _$ScheduleTimeDataFromJson(json);
  Map<String,dynamic> toJson() => _$ScheduleTimeDataToJson(this);
}
