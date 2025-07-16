import 'package:json_annotation/json_annotation.dart';

part 'userOffice.g.dart';

@JsonSerializable()
class UserOffice {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String? fcmToken;
  final bool enabled;
  final String role;
  final String status;
  final String imageUrl;

  UserOffice({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.fcmToken,
    required this.enabled,
    required this.role,
    required this.status,
    required this.imageUrl,
  });

  factory UserOffice.fromJson(Map<String, dynamic> json) =>
      _$UserOfficeFromJson(json);
  Map<String, dynamic> toJson() => _$UserOfficeToJson(this);
}
