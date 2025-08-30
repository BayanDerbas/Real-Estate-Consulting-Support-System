import 'package:json_annotation/json_annotation.dart';
import 'get_me_client_response.dart';

part 'get_me_client.g.dart';

@JsonSerializable()
class GetMeClient {
  final String? status;
  final GetMeResponse data;

  GetMeClient({this.status, required this.data});

  factory GetMeClient.fromJson(Map<String, dynamic> json) => _$GetMeClientFromJson(json);
  Map<String, dynamic> toJson() => _$GetMeClientToJson(this);
}