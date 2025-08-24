import 'package:json_annotation/json_annotation.dart';

import '../../../../officers/data/model/userOffice.dart';

part 'propertiesByOfficeId_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PropertiesByOfficeIdResponse {
  final String status;
  final PropertyData data;

  PropertiesByOfficeIdResponse({required this.status, required this.data});

  factory PropertiesByOfficeIdResponse.fromJson(Map<String, dynamic> json) =>
      _$PropertiesByOfficeIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PropertiesByOfficeIdResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PropertyData {
  final List<Property> content;
  final int totalElements;
  final int totalPages;
  final bool last;

  PropertyData({
    required this.content,
    required this.totalElements,
    required this.totalPages,
    required this.last,
  });

  factory PropertyData.fromJson(Map<String, dynamic> json) =>
      _$PropertyDataFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Property {
  final int viewsCount;
  final List<PropertyImage> propertyImageList;
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
  final Office? office;
  Property({
    required this.id,
    required this.description,
    required this.houseType,
    required this.serviceType,
    required this.location,
    required this.price,
    required this.area,
    required this.numberOfBed,
    required this.numberOfRooms,
    required this.numberOfBathrooms,
    required this.latitude,
    required this.longitude,
    required this.viewsCount,
    required this.propertyImageList,
    required this.office,
    required this.priceInMonth,
    required this.direction,
  });

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyToJson(this);
}

@JsonSerializable()
class PropertyImage {
  final int id;
  final String imageUrl;
  final String type;

  PropertyImage({required this.id, required this.imageUrl, required this.type});

  factory PropertyImage.fromJson(Map<String, dynamic> json) =>
      _$PropertyImageFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyImageToJson(this);
}

@JsonSerializable()
class Office {
  final int id;
  final int userId;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String imageUrl;
  final UserOffice? user;
  final String? bio;
  final String? location;
  final double? latitude;
  final double? longitude;
  final String? commercialRegisterImage;

  Office({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.imageUrl,
    this.user,
    this.bio,
    this.location,
    this.latitude,
    this.longitude,
    this.commercialRegisterImage,
  });

  factory Office.fromJson(Map<String, dynamic> json) =>
      _$OfficeFromJson(json);

  Map<String, dynamic> toJson() => _$OfficeToJson(this);
}
