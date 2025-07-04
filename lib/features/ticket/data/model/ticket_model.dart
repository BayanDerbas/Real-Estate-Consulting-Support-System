import 'package:graduation_project/features/Auth/data/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_model.g.dart';

@JsonSerializable()
class Ticket {
  final int id;
  final String description;
  final String houseType;
  final String serviceType;
  final String location;
  final String direction;
  final num lowPrice;
  final num highPrice;
  final num area;
  final int numberOfBed;
  final int numberOfRooms;
  final int numberOfBathrooms;
  final String dateTime;
  final Client client;

  Ticket({
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

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
  Map<String, dynamic> toJson() => _$TicketToJson(this);
}

@JsonSerializable()
class Client {
  final int? id;
  final UserModel? user;

  Client(this.id, this.user);
  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
