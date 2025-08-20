// lib/features/Auth/data/model/change_password_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'check_status_model.g.dart';

@JsonSerializable()
class CheckStatusModel {
  final int? id;
  final String? userStatus;

  CheckStatusModel({this.id, this.userStatus});

  Map<String, dynamic> toJson() => _$CheckStatusModelToJson(this);
  factory CheckStatusModel.fromJson(Map<String, dynamic> json) =>
      _$CheckStatusModelFromJson(json);
}
