// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
  id: (json['id'] as num).toInt(),
  description: json['description'] as String,
  houseType: json['houseType'] as String,
  serviceType: json['serviceType'] as String,
  location: json['location'] as String,
  direction: json['direction'] as String,
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
  'houseType': instance.houseType,
  'serviceType': instance.serviceType,
  'location': instance.location,
  'direction': instance.direction,
  'lowPrice': instance.lowPrice,
  'highPrice': instance.highPrice,
  'area': instance.area,
  'numberOfBed': instance.numberOfBed,
  'numberOfRooms': instance.numberOfRooms,
  'numberOfBathrooms': instance.numberOfBathrooms,
  'dateTime': instance.dateTime,
  'client': instance.client,
};
