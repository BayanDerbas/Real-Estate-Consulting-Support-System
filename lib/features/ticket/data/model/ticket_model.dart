import 'package:graduation_project/features/Auth/data/model/user_model.dart';
import 'package:graduation_project/features/service%20provider/data/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_model.g.dart';

enum HouseType { HOME, UPPER_FLOOR, VILLA, OFFICE, LAND, STORE, OTHER }

enum Direction {
  SOUTH,
  NORTH,
  EAST,
  WEST,
  SOUTH_WEST,
  SOUTH_EAST,
  NORTH_EAST,
  NORTH_WEST,
}

enum ServiceType { BUY, SELL, RENT }

class EnumModel<T> {
  final String label;
  final T value;
  EnumModel({required this.label, required this.value});
}

@JsonSerializable()
class Ticket {
  final int id;
  final String description;
  final HouseType? houseType;
  final ServiceType? serviceType;
  final String location;
  final Direction? direction;
  final num lowPrice;
  final num highPrice;
  final num area;
  final int numberOfBed;
  final int numberOfRooms;
  final int numberOfBathrooms;
  final String dateTime;
  final UserModel client;

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
