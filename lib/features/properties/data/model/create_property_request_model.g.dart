// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_property_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePropertyRequestModel _$CreatePropertyRequestModelFromJson(
  Map<String, dynamic> json,
) => CreatePropertyRequestModel(
  description: json['description'] as String?,
  houseType: $enumDecodeNullable(_$HouseTypeEnumMap, json['houseType']),
  serviceType: $enumDecodeNullable(_$ServiceTypeEnumMap, json['serviceType']),
  location: json['location'] as String?,
  direction: $enumDecodeNullable(_$DirectionEnumMap, json['direction']),
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
  'houseType': _$HouseTypeEnumMap[instance.houseType],
  'serviceType': _$ServiceTypeEnumMap[instance.serviceType],
  'location': instance.location,
  'direction': _$DirectionEnumMap[instance.direction],
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

const _$HouseTypeEnumMap = {
  HouseType.HOME: 'HOME',
  HouseType.UPPER_FLOOR: 'UPPER_FLOOR',
  HouseType.VILLA: 'VILLA',
  HouseType.OFFICE: 'OFFICE',
  HouseType.LAND: 'LAND',
  HouseType.STORE: 'STORE',
  HouseType.OTHER: 'OTHER',
};

const _$ServiceTypeEnumMap = {
  ServiceType.BUY: 'BUY',
  ServiceType.SELL: 'SELL',
  ServiceType.RENT: 'RENT',
};

const _$DirectionEnumMap = {
  Direction.SOUTH: 'SOUTH',
  Direction.NORTH: 'NORTH',
  Direction.EAST: 'EAST',
  Direction.WEST: 'WEST',
  Direction.SOUTH_WEST: 'SOUTH_WEST',
  Direction.SOUTH_EAST: 'SOUTH_EAST',
  Direction.NORTH_EAST: 'NORTH_EAST',
  Direction.NORTH_WEST: 'NORTH_WEST',
};
