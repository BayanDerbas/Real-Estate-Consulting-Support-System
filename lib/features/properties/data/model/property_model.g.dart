// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyModel _$PropertyModelFromJson(Map<String, dynamic> json) =>
    PropertyModel(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
      houseType: json['houseType'] as String,
      serviceType: json['serviceType'] as String,
      location: json['location'] as String,
      direction: json['direction'] as String,
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
      'office': instance.office,
      'propertyImageList': instance.propertyImageList,
    };
