import 'package:json_annotation/json_annotation.dart';
import 'login_model.dart';

part 'login_wrapper_model.g.dart';

@JsonSerializable()
class LoginWrapperResponseModel {
  final String? status;
  final LoginResponseModel? data;

  LoginWrapperResponseModel({this.status, this.data});

  factory LoginWrapperResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginWrapperResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginWrapperResponseModelToJson(this);
}
