import 'package:json_annotation/json_annotation.dart';
import '../../../Auth/data/model/user_model.dart';

part 'publish_ticket_response_model.g.dart';

enum HouseType {
  @JsonValue("UPPER_FLOOR")
  upperFloor,
  @JsonValue("LOWER_FLOOR")
  lowerFloor,
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
  final int id;
  final String description;
  final HouseType houseType;
  final ServiceType serviceType;
  final String location;
  final String direction;
  final double lowPrice;
  final double highPrice;
  final double area;
  final int numberOfBed;
  final int numberOfRooms;
  final int numberOfBathrooms;
  final String dateTime;
  final Client client;

  TicketData({
    required this.id,
    required this.description,
    required this.houseType,
    required this.serviceType,
    required this.location,
    required this.direction,
    required this.lowPrice,
    required this.highPrice,
    required this.area,
    required this.numberOfBed,
    required this.numberOfRooms,
    required this.numberOfBathrooms,
    required this.dateTime,
    required this.client,
  });

  factory TicketData.fromJson(Map<String, dynamic> json) =>
      _$TicketDataFromJson(json);

  Map<String, dynamic> toJson() => _$TicketDataToJson(this);
}

@JsonSerializable()
class Client {
  final int id;
  final UserModel user;
  final List<dynamic> favorites;
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
