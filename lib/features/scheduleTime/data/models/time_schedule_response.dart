import 'package:graduation_project/features/scheduleTime/data/models/time_schedule_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_schedule_response.g.dart';

@JsonSerializable()
class ScheduleTimeResponse{
  final String? status;
  final List<ScheduleTimeData>? data;

  ScheduleTimeResponse(this.status, this.data);
  factory ScheduleTimeResponse.fromJson(Map<String,dynamic> json) => _$ScheduleTimeResponseFromJson(json);
  Map<String,dynamic> toJson() => _$ScheduleTimeResponseToJson(this);
}