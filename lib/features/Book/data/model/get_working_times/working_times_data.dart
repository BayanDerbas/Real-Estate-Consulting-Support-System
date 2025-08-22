import 'package:json_annotation/json_annotation.dart';

part 'working_times_data.g.dart';

@JsonSerializable()
class WorkingTimesData {
  final int? id;
  final String? dayOfWeek;
  final String? startTime;
  final String? endTime;
  final String? callType;

  WorkingTimesData(
    this.id,
    this.dayOfWeek,
    this.startTime,
    this.endTime,
    this.callType,
  );

  factory WorkingTimesData.fromJson(Map<String,dynamic> json) => _$WorkingTimesDataFromJson(json);
  Map<String,dynamic> toJson() => _$WorkingTimesDataToJson(this);
}
