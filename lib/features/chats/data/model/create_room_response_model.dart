import 'package:graduation_project/features/officers/data/model/userOffice.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:graduation_project/features/Auth/data/model/user_model.dart';

part 'create_room_response_model.g.dart';

@JsonSerializable()
class CreateRoomResponseModel {
  final UserModel? user1;
  final UserModel? user2;
  final int? id;
  final String? status;
  final String? createdAt;
  CreateRoomResponseModel({
    required this.user1,
    required this.user2,
    required this.id,
    required this.createdAt,
    required this.status,
  });

  factory CreateRoomResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateRoomResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRoomResponseModelToJson(this);
}
