import 'package:json_annotation/json_annotation.dart';

part 'publish_ticket_request_model.g.dart';

@JsonSerializable()
class PublishTicketRequestModel {
  final String clientId;
  final String description;
  final String houseType;
  final String serviceType;
  final String location;
  final String direction;
  final double lowPrice;
  final double highPrice;
  final double area;
  final int numberOfBed;
  final int numberOfRooms;
  final int numberOfBathrooms;
  final DateTime dateTime;

  PublishTicketRequestModel({
    required this.clientId,
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
  });

  factory PublishTicketRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PublishTicketRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PublishTicketRequestModelToJson(this);
}
