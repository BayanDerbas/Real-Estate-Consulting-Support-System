import 'package:json_annotation/json_annotation.dart';
import 'package:graduation_project/features/Auth/data/model/user_model.dart';

part 'room_model.g.dart';

@JsonSerializable()
class ChatRoomModel {
  final UserModel user1;
  final UserModel user2;
  final String roomKey;
  final String createdAt;

  ChatRoomModel({
    required this.user1,
    required this.user2,
    required this.roomKey,
    required this.createdAt,
  });

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomModelToJson(this);
}
