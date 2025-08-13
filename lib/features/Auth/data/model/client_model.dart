import 'package:graduation_project/features/Auth/data/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_model.g.dart';

@JsonSerializable()
class ClientModel {
  final int? id;
  final UserModel? user;
  final List<dynamic>? favorites;
  final List<dynamic>? following;

  ClientModel({this.id, this.user, this.favorites, this.following});

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClientModelToJson(this);
}
