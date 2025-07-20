import 'package:json_annotation/json_annotation.dart';

import 'propertyImage_model.dart';

part 'property_model.g.dart';

@JsonSerializable()
class PropertyModel {
  final int id;
  final String description;
  final String houseType;
  final String serviceType;
  final String location;
  final String direction;
  final double price;
  final double priceInMonth;
  final double area;
  final int numberOfBed;
  final int numberOfRooms;
  final int numberOfBathrooms;
  final double latitude;
  final double longitude;
  final int? officeId;

  @JsonKey(name: 'propertyImageList')
  final List<PropertyImageModel> propertyImageList;

  PropertyModel({
    required this.officeId,
    required this.id,
    required this.description,
    required this.houseType,
    required this.serviceType,
    required this.location,
    required this.direction,
    required this.price,
    required this.priceInMonth,
    required this.area,
    required this.numberOfBed,
    required this.numberOfRooms,
    required this.numberOfBathrooms,
    required this.latitude,
    required this.longitude,
    required this.propertyImageList,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyModelToJson(this);
}