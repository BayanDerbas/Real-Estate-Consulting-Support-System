import 'package:json_annotation/json_annotation.dart';
import 'working_times_model.dart';

part 'show_working_times_response.g.dart';

@JsonSerializable()
class ShowAvailableTimesResponse{
  final String status;
  final List<AvailableTime>? data;

  ShowAvailableTimesResponse({required this.status, required this.data});

  factory ShowAvailableTimesResponse.fromJson(Map<String,dynamic> json) => _$ShowAvailableTimesResponseFromJson(json);
  Map<String,dynamic> toJson() => _$ShowAvailableTimesResponseToJson(this);
}