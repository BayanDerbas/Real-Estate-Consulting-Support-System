import 'package:json_annotation/json_annotation.dart';
import '../../../Auth/data/model/user_model.dart';

part 'publish_ticket_response_model.g.dart';

enum HouseType {
  @JsonValue("HOME")
  home,
  @JsonValue("UPPER_FLOOR")
  upperFloor,
  @JsonValue("LOWER_FLOOR")
  lowerFloor,
  @JsonValue("VILLA")
  villa,
  @JsonValue("OFFICE")
  office,
  @JsonValue("LAND")
  land,
  @JsonValue("STORE")
  store,
  @JsonValue("OTHER")
  other,
}

enum ServiceType {
  @JsonValue("BUY")
  buy,
  @JsonValue("RENT")
  rent,
}

@JsonSerializable()
class PublishTicketResponseModel {
  final String status;
  final TicketData data;

  PublishTicketResponseModel({required this.status, required this.data});

  factory PublishTicketResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PublishTicketResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PublishTicketResponseModelToJson(this);
}

@JsonSerializable()
class TicketData {
  final int? id;
  final String? description;
  final HouseType? houseType;
  final ServiceType? serviceType;
  final String? location;
  final String? direction;
  final double? lowPrice;
  final double? highPrice;
  final double? area;
  final int? numberOfBed;
  final int? numberOfRooms;
  final int? numberOfBathrooms;
  final String? dateTime;
  final Client? client;

  TicketData({
    this.id,
    this.description,
    this.houseType,
    this.serviceType,
    this.location,
    this.direction,
    this.lowPrice,
    this.highPrice,
    this.area,
    this.numberOfBed,
    this.numberOfRooms,
    this.numberOfBathrooms,
    this.dateTime,
    this.client,
  });

  factory TicketData.fromJson(Map<String, dynamic> json) =>
      _$TicketDataFromJson(json);

  Map<String, dynamic> toJson() => _$TicketDataToJson(this);
}

@JsonSerializable()
class Client {
  final int? id;
  final UserModel? user;
  final List<dynamic>? favorites;
  final List<dynamic>? following;

  Client({this.id, this.user, this.favorites, this.following});

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
