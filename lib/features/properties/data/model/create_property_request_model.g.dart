// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_property_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePropertyRequestModel _$CreatePropertyRequestModelFromJson(
  Map<String, dynamic> json,
) => CreatePropertyRequestModel(
  description: json['description'] as String?,
  houseType: json['houseType'] as String?,
  serviceType: json['serviceType'] as String?,
  location: json['location'] as String?,
  direction: json['direction'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  priceInMonth: (json['priceInMonth'] as num?)?.toDouble(),
  area: (json['area'] as num?)?.toDouble(),
  numberOfBed: (json['numberOfBed'] as num?)?.toInt(),
  numberOfRooms: (json['numberOfRooms'] as num?)?.toInt(),
  numberOfBathrooms: (json['numberOfBathrooms'] as num?)?.toInt(),
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  officeId: (json['officeId'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreatePropertyRequestModelToJson(
  CreatePropertyRequestModel instance,
) => <String, dynamic>{
  'description': instance.description,
  'houseType': instance.houseType,
  'serviceType': instance.serviceType,
  'location': instance.location,
  'direction': instance.direction,
  'price': instance.price,
  'priceInMonth': instance.priceInMonth,
  'area': instance.area,
  'numberOfBed': instance.numberOfBed,
  'numberOfRooms': instance.numberOfRooms,
  'numberOfBathrooms': instance.numberOfBathrooms,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'officeId': instance.officeId,
};
