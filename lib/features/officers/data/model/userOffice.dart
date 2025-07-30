import 'package:json_annotation/json_annotation.dart';

part 'userOffice.g.dart';

@JsonSerializable()
class UserOffice {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? fcmToken;
  final bool? enabled;
  final String? role;
  final String? status;
  final String? imageUrl;

  UserOffice({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.fcmToken,
    this.enabled,
    this.role,
    this.status,
    this.imageUrl,
  });

  factory UserOffice.fromJson(Map<String, dynamic> json) =>
      _$UserOfficeFromJson(json);
  Map<String, dynamic> toJson() => _$UserOfficeToJson(this);
}
