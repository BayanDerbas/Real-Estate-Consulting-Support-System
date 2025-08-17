import 'package:json_annotation/json_annotation.dart';

part 'create_room_request_model.g.dart';

@JsonSerializable()
class CreateRoomRequestModel {
  final int? userId1;
  final int? userId2;

  CreateRoomRequestModel({this.userId1, this.userId2});

  factory CreateRoomRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateRoomRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRoomRequestModelToJson(this);
}
