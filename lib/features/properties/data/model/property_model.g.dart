// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyModel _$PropertyModelFromJson(Map<String, dynamic> json) =>
    PropertyModel(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
      houseType: $enumDecode(_$HouseTypeEnumMap, json['houseType']),
      serviceType: $enumDecode(_$ServiceTypeEnumMap, json['serviceType']),
      location: json['location'] as String,
      direction: $enumDecode(_$DirectionEnumMap, json['direction']),
      price: (json['price'] as num).toDouble(),
      priceInMonth: (json['priceInMonth'] as num).toDouble(),
      area: (json['area'] as num).toDouble(),
      numberOfBed: (json['numberOfBed'] as num).toInt(),
      numberOfRooms: (json['numberOfRooms'] as num).toInt(),
      numberOfBathrooms: (json['numberOfBathrooms'] as num).toInt(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      office:
          json['office'] == null
              ? null
              : Office.fromJson(json['office'] as Map<String, dynamic>),
      propertyImageList:
          (json['propertyImageList'] as List<dynamic>)
              .map(
                (e) => PropertyImageModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$PropertyModelToJson(PropertyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'houseType': _$HouseTypeEnumMap[instance.houseType]!,
      'serviceType': _$ServiceTypeEnumMap[instance.serviceType]!,
      'location': instance.location,
      'direction': _$DirectionEnumMap[instance.direction]!,
      'price': instance.price,
      'priceInMonth': instance.priceInMonth,
      'area': instance.area,
      'numberOfBed': instance.numberOfBed,
      'numberOfRooms': instance.numberOfRooms,
      'numberOfBathrooms': instance.numberOfBathrooms,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'office': instance.office,
      'propertyImageList': instance.propertyImageList,
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
