import 'package:json_annotation/json_annotation.dart';

import '../../../ticket/data/model/ticket_model.dart';

part 'create_property_response_model.g.dart';

@JsonSerializable()
class CreatePropertyResponseModel {
  final String? status;
  final PropertyDataResponseModel? data;

  CreatePropertyResponseModel({this.status, this.data});

  factory CreatePropertyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePropertyResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePropertyResponseModelToJson(this);
}

@JsonSerializable()
class PropertyDataResponseModel {
  final int? id;
  final String? description;
  final HouseType? houseType;
  final ServiceType? serviceType;
  final String? location;
  final Direction? direction;
  final int? price;
  final int? priceInMonth;
  final int? area;
  final int? numberOfBed;
  final int? numberOfRooms;
  final int? numberOfBathrooms;
  final double? latitude;
  final double? longitude;
  final List<String>? propertyImageList;
  final OfficeDataResposeModel? office;

  PropertyDataResponseModel({
    this.id,
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
    this.propertyImageList,
    this.office,
  });

  factory PropertyDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyDataResponseModelToJson(this);
}

@JsonSerializable()
class OfficeDataResposeModel {
  final int? id;
  final int? userId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? imageUrl;

  OfficeDataResposeModel({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.imageUrl,
  });

  factory OfficeDataResposeModel.fromJson(Map<String, dynamic> json) =>
      _$OfficeDataResposeModelFromJson(json);

  Map<String, dynamic> toJson() => _$OfficeDataResposeModelToJson(this);
}
