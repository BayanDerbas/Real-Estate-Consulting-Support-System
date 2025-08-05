// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publish_ticket_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublishTicketRequestModel _$PublishTicketRequestModelFromJson(
  Map<String, dynamic> json,
) => PublishTicketRequestModel(
  clientId: json['clientId'] as String?,
  description: json['description'] as String?,
  houseType: json['houseType'] as String?,
  serviceType: json['serviceType'] as String?,
  location: json['location'] as String?,
  direction: json['direction'] as String?,
  lowPrice: (json['lowPrice'] as num?)?.toDouble(),
  highPrice: (json['highPrice'] as num?)?.toDouble(),
  area: (json['area'] as num?)?.toDouble(),
  numberOfBed: (json['numberOfBed'] as num?)?.toInt(),
  numberOfRooms: (json['numberOfRooms'] as num?)?.toInt(),
  numberOfBathrooms: (json['numberOfBathrooms'] as num?)?.toInt(),
  dateTime:
      json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
);

Map<String, dynamic> _$PublishTicketRequestModelToJson(
  PublishTicketRequestModel instance,
) => <String, dynamic>{
  'clientId': instance.clientId,
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
  'dateTime': instance.dateTime?.toIso8601String(),
};
