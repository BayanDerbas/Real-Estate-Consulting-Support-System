import 'package:graduation_project/features/officers/data/model/userOffice.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:graduation_project/features/Auth/data/model/user_model.dart';

part 'rooms_of_current_user.g.dart';

@JsonSerializable()
class RoomsOfCurrentUser {
  final UserModel otherUser;
  final String roomKey;
  final String createdAt;

  RoomsOfCurrentUser({
    required this.otherUser,
    required this.roomKey,
    required this.createdAt,
  });

  factory RoomsOfCurrentUser.fromJson(Map<String, dynamic> json) =>
      _$RoomsOfCurrentUserFromJson(json);

  Map<String, dynamic> toJson() => _$RoomsOfCurrentUserToJson(this);
}
