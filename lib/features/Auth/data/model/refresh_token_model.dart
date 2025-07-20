import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_model.g.dart';

@JsonSerializable()
class RefreshRequestModel {
  final String? refreshToken;

  RefreshRequestModel({this.refreshToken});

  Map<String, dynamic> toJson() => _$RefreshRequestModelToJson(this);
}

@JsonSerializable()
class RefreshResponseModel {
  final String? token;
  final String? refreshToken;

  RefreshResponseModel({this.token, this.refreshToken});

  factory RefreshResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshResponseModelToJson(this);
}

@JsonSerializable()
class RefreshWrappedResponse {
  final String? status;
  final RefreshResponseModel? data;

  RefreshWrappedResponse({this.status, this.data});

  factory RefreshWrappedResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshWrappedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshWrappedResponseToJson(this);
}
