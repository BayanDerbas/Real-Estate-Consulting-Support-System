// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketDataModel _$TicketDataModelFromJson(Map<String, dynamic> json) =>
    TicketDataModel(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String?,
      houseType: json['houseType'] as String?,
      serviceType: json['serviceType'] as String?,
      location: json['location'] as String?,
      direction: json['direction'] as String?,
      lowPrice: (json['lowPrice'] as num?)?.toInt(),
      highPrice: (json['highPrice'] as num?)?.toInt(),
      area: (json['area'] as num?)?.toInt(),
      numberOfBed: (json['numberOfBed'] as num?)?.toInt(),
      numberOfRooms: (json['numberOfRooms'] as num?)?.toInt(),
      numberOfBathrooms: (json['numberOfBathrooms'] as num?)?.toInt(),
      client:
          json['client'] == null
              ? null
              : ClientModel.fromJson(json['client'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketDataModelToJson(TicketDataModel instance) =>
    <String, dynamic>{
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
      'client': instance.client,
    };
