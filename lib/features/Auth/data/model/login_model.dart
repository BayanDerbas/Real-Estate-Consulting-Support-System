import 'package:json_annotation/json_annotation.dart';
import '../../../officers/data/model/office.dart';
import '../../../service provider/data/model/expert.dart';
import 'user_model.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginRequestModel {
  final String? email;
  final String? password;

  LoginRequestModel({this.email, this.password});

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}

@JsonSerializable()
class LoginResponseModel {
  final String? token;
  final String? refreshToken;
  final UserModel? user;
  final Expert? expert;
  final Office? office;

  LoginResponseModel({this.token, this.refreshToken, this.user, this.office , this.expert});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
