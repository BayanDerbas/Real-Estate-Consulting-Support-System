import 'package:json_annotation/json_annotation.dart';

part 'delete_time_model.g.dart';

@JsonSerializable()
class DeleteTimeModel {
  final String? status;
  final String? data;

  DeleteTimeModel(this.status, this.data);
  factory DeleteTimeModel.fromJson(Map<String,dynamic> json) => _$DeleteTimeModelFromJson(json);
  Map<String,dynamic> toJson() => _$DeleteTimeModelToJson(this);
}