// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_property_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePropertyResponseModel _$CreatePropertyResponseModelFromJson(
  Map<String, dynamic> json,
) => CreatePropertyResponseModel(
  status: json['status'] as String?,
  data:
      json['data'] == null
          ? null
          : PropertyDataResponseModel.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$CreatePropertyResponseModelToJson(
  CreatePropertyResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

PropertyDataResponseModel _$PropertyDataResponseModelFromJson(
  Map<String, dynamic> json,
) => PropertyDataResponseModel(
  id: (json['id'] as num?)?.toInt(),
  description: json['description'] as String?,
  houseType: $enumDecodeNullable(_$HouseTypeEnumMap, json['houseType']),
  serviceType: $enumDecodeNullable(_$ServiceTypeEnumMap, json['serviceType']),
  location: json['location'] as String?,
  direction: $enumDecodeNullable(_$DirectionEnumMap, json['direction']),
  price: (json['price'] as num?)?.toInt(),
  priceInMonth: (json['priceInMonth'] as num?)?.toInt(),
  area: (json['area'] as num?)?.toInt(),
  numberOfBed: (json['numberOfBed'] as num?)?.toInt(),
  numberOfRooms: (json['numberOfRooms'] as num?)?.toInt(),
  numberOfBathrooms: (json['numberOfBathrooms'] as num?)?.toInt(),
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  propertyImageList:
      (json['propertyImageList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  office:
      json['office'] == null
          ? null
          : OfficeDataResposeModel.fromJson(
            json['office'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$PropertyDataResponseModelToJson(
  PropertyDataResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
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
  'propertyImageList': instance.propertyImageList,
  'office': instance.office,
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

OfficeDataResposeModel _$OfficeDataResposeModelFromJson(
  Map<String, dynamic> json,
) => OfficeDataResposeModel(
  id: (json['id'] as num?)?.toInt(),
  userId: (json['userId'] as num?)?.toInt(),
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  imageUrl: json['imageUrl'] as String?,
);

Map<String, dynamic> _$OfficeDataResposeModelToJson(
  OfficeDataResposeModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phone': instance.phone,
  'imageUrl': instance.imageUrl,
};
