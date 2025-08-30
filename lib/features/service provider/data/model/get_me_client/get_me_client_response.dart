import 'package:json_annotation/json_annotation.dart';

part 'get_me_client_response.g.dart';

@JsonSerializable()
class GetMeResponse {
  final int? id;
  final GetMeUser? user;
  final List<int> favorites;
  final List<int> followers;

  GetMeResponse({
    this.id,
    this.user,
    this.favorites = const [],
    this.followers = const [],
  });

  factory GetMeResponse.fromJson(Map<String, dynamic> json) => _$GetMeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetMeResponseToJson(this);
}

@JsonSerializable()
class GetMeUser {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final String? status;
  final String? imageUrl;
  final int? warnsCount;
  final int? blocksCount;

  GetMeUser({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.status,
    this.imageUrl,
    this.warnsCount,
    this.blocksCount,
  });

  factory GetMeUser.fromJson(Map<String, dynamic> json) => _$GetMeUserFromJson(json);
  Map<String, dynamic> toJson() => _$GetMeUserToJson(this);
}