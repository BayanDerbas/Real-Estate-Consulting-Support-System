import 'package:json_annotation/json_annotation.dart';

import '../../../ticket/data/model/ticket_model.dart';

part 'create_property_request_model.g.dart';

@JsonSerializable()
class CreatePropertyRequestModel {
  final String? description;
  final HouseType? houseType;
  final ServiceType? serviceType;
  final String? location;
  final Direction? direction;
  final double? price;
  final double? priceInMonth;
  final double? area;
  final int? numberOfBed;
  final int? numberOfRooms;
  final int? numberOfBathrooms;
  final double? latitude;
  final double? longitude;
  final int? officeId;
  CreatePropertyRequestModel({
    this.description,
    this.houseType,
    this.serviceType,
    this.location,
    this.direction,
    this.price,
    this.priceInMonth,
    this.area,
    this.numberOfBed,
    this.numberOfRooms,
    this.numberOfBathrooms,
    this.latitude,
    this.longitude,
    this.officeId,
  });
  factory CreatePropertyRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePropertyRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreatePropertyRequestModelToJson(this);
}
