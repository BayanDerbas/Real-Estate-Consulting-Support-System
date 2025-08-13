import 'package:json_annotation/json_annotation.dart';
import '../../../service provider/data/model/user.dart';

part 'client_model.g.dart';

@JsonSerializable()
class Client {
  final int id;
  final User user;

  @JsonKey(fromJson: _listFromJson)
  final List<dynamic> favorites;

  @JsonKey(name: 'followers', fromJson: _listFromJson)
  final List<dynamic> following;

  Client({
    required this.id,
    required this.user,
    required this.favorites,
    required this.following,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}

List<dynamic> _listFromJson(dynamic json) {
  if (json == null) return [] as List;
  if (json is List) return json;
  throw Exception("Expected a list, but got: ${json.runtimeType}");
}
