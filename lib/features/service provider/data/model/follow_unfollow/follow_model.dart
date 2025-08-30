import 'package:json_annotation/json_annotation.dart';

part 'follow_model.g.dart';

@JsonSerializable()
class FollowModel {
  final String? status;
  final String? data;

  FollowModel(this.status, this.data);
  factory FollowModel.fromJson(Map<String,dynamic> json) => _$FollowModelFromJson(json);
  Map<String,dynamic> toJson() => _$FollowModelToJson(this);
}