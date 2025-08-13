import 'package:json_annotation/json_annotation.dart';

part 'working_times_model.g.dart';

@JsonSerializable()
class AvailableTime {
  final int id;
  final String? dayOfWeek;
  final String? startTime;
  final String? endTime;
  final String? callType;

  AvailableTime({
    required this.id,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
    required this.callType,
  });

  factory AvailableTime.fromJson(Map<String, dynamic> json) =>
      _$AvailableTimeFromJson(json);
  Map<String, dynamic> toJson() => _$AvailableTimeToJson(this);
}
