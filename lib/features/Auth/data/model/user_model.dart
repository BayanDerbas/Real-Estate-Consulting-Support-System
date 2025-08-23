import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final bool? enabled;
  final String? role;
  final String? status;
  final String? imageUrl;
  final int? warnsCount;
  final int? blocksCount;

  UserModel({
    required this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.enabled = false,
    this.role,
    this.status,
    this.imageUrl = '',
    this.blocksCount,
    this.warnsCount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
