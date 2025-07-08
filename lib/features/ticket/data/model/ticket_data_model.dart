import 'package:graduation_project/features/Auth/data/model/client_model.dart'; // Make sure this path is correct
import 'package:json_annotation/json_annotation.dart';

part 'ticket_data_model.g.dart';

@JsonSerializable()
class TicketDataModel {
  final int id;
  final String? description;
  final String? houseType;
  final String? serviceType;
  final String? location;
  final String? direction;
  final int? lowPrice;
  final int? highPrice;
  final int? area;
  final int? numberOfBed;
  final int? numberOfRooms;
  final int? numberOfBathrooms;

  final ClientModel? client;

  TicketDataModel({
    required this.id,
    this.description,
    this.houseType,
    this.serviceType,
    this.location,
    this.direction,
    required this.lowPrice,
    required this.highPrice,
    required this.area,
    required this.numberOfBed,
    required this.numberOfRooms,
    required this.numberOfBathrooms,

    this.client,
  });

  factory TicketDataModel.fromJson(Map<String, dynamic> json) =>
      _$TicketDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$TicketDataModelToJson(this);
}
