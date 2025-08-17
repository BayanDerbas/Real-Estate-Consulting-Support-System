import 'package:json_annotation/json_annotation.dart';
import '../../../Auth/data/model/user_model.dart';

part 'create_room_response_model.g.dart';

/// Model for the inner "data" object
@JsonSerializable()
class CreateRoomResponseModel {
  final UserModel? user1;
  final UserModel? user2;
  final int? id;
  final String? status;
  final String? createdAt;

  CreateRoomResponseModel({
    this.user1,
    this.user2,
    this.id,
    this.status,
    this.createdAt,
  });

  factory CreateRoomResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateRoomResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRoomResponseModelToJson(this);
}

@JsonSerializable()
class CreateRoomApiResponse {
  final String? status;
  final CreateRoomResponseModel? data;

  CreateRoomApiResponse({this.status, this.data});

  factory CreateRoomApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRoomApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRoomApiResponseToJson(this);
}
