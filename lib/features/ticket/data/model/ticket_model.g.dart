// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
  id: (json['id'] as num).toInt(),
  description: json['description'] as String,
  houseType: $enumDecodeNullable(_$HouseTypeEnumMap, json['houseType']),
  serviceType: $enumDecodeNullable(_$ServiceTypeEnumMap, json['serviceType']),
  location: json['location'] as String,
  direction: $enumDecodeNullable(_$DirectionEnumMap, json['direction']),
  lowPrice: json['lowPrice'] as num,
  highPrice: json['highPrice'] as num,
  area: json['area'] as num,
  numberOfBed: (json['numberOfBed'] as num).toInt(),
  numberOfRooms: (json['numberOfRooms'] as num).toInt(),
  numberOfBathrooms: (json['numberOfBathrooms'] as num).toInt(),
  dateTime: json['dateTime'] as String,
  client: UserModel.fromJson(json['client'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
  'id': instance.id,
  'description': instance.description,
  'houseType': _$HouseTypeEnumMap[instance.houseType],
  'serviceType': _$ServiceTypeEnumMap[instance.serviceType],
  'location': instance.location,
  'direction': _$DirectionEnumMap[instance.direction],
  'lowPrice': instance.lowPrice,
  'highPrice': instance.highPrice,
  'area': instance.area,
  'numberOfBed': instance.numberOfBed,
  'numberOfRooms': instance.numberOfRooms,
  'numberOfBathrooms': instance.numberOfBathrooms,
  'dateTime': instance.dateTime,
  'client': instance.client,
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
