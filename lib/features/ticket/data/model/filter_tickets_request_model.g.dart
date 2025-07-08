// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_tickets_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterTicketsModel _$FilterTicketsModelFromJson(Map<String, dynamic> json) =>
    FilterTicketsModel(
      lowPrice: (json['lowPrice'] as num?)?.toDouble(),
      highPrice: (json['highPrice'] as num?)?.toDouble(),
      serviceType: json['serviceType'] as String?,
      houseType: json['houseType'] as String?,
      lowArea: json['lowArea'] as String?,
      highArea: json['highArea'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$FilterTicketsModelToJson(FilterTicketsModel instance) =>
    <String, dynamic>{
      'lowPrice': instance.lowPrice,
      'highPrice': instance.highPrice,
      'serviceType': instance.serviceType,
      'houseType': instance.houseType,
      'lowArea': instance.lowArea,
      'highArea': instance.highArea,
      'location': instance.location,
    };
