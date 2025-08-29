import 'package:graduation_project/features/ticket/data/model/publish_ticket_response_model.dart';
import 'package:graduation_project/features/ticket/data/model/ticket_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'publish_ticket_request_model.g.dart';

@JsonSerializable()
class PublishTicketRequestModel {
  final String? clientId;
  final String? description;
  final HouseType? houseType;
  final ServiceType? serviceType;
  final String? location;
  final Direction? direction;
  final double? lowPrice;
  final double? highPrice;
  final double? area;
  final int? numberOfBed;
  final int? numberOfRooms;
  final int? numberOfBathrooms;
  final DateTime? dateTime;
  PublishTicketRequestModel({
    this.clientId,
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
  });

  factory PublishTicketRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PublishTicketRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PublishTicketRequestModelToJson(this);
}
