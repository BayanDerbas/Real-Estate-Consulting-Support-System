import 'package:graduation_project/features/Book/data/model/get_working_times/working_times_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'working_times_response.g.dart';

@JsonSerializable()
class WorkingTimesResponse{
  final String? status;
  final List<WorkingTimesData>? data;

  WorkingTimesResponse(this.status, this.data);

  factory WorkingTimesResponse.fromJson(Map<String,dynamic> json) => _$WorkingTimesResponseFromJson(json);
  Map<String,dynamic> toJson() => _$WorkingTimesResponseToJson(this);
}