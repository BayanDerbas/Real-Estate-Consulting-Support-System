import 'package:json_annotation/json_annotation.dart';

part 'time_schedule_request.g.dart';
@JsonSerializable()
class ScheduleTimeRequest {
  final int? id;
  final String? day;
  final String? startTime;
  final String? endTime;
  final String? callType;

  ScheduleTimeRequest(this.id, this.day, this.startTime, this.endTime, this.callType);
  factory ScheduleTimeRequest.fromJson(Map<String,dynamic> json) => _$ScheduleTimeRequestFromJson(json);
  Map<String,dynamic> toJson() => _$ScheduleTimeRequestToJson(this);
}