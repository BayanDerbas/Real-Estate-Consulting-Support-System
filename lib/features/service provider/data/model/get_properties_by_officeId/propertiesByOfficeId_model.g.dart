// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'propertiesByOfficeId_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertiesByOfficeIdResponse _$PropertiesByOfficeIdResponseFromJson(
  Map<String, dynamic> json,
) => PropertiesByOfficeIdResponse(
  status: json['status'] as String,
  data: PropertyData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PropertiesByOfficeIdResponseToJson(
  PropertiesByOfficeIdResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'data': instance.data.toJson(),
};

PropertyData _$PropertyDataFromJson(Map<String, dynamic> json) => PropertyData(
  content:
      (json['content'] as List<dynamic>)
          .map((e) => Property.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalElements: (json['totalElements'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  last: json['last'] as bool,
);

Map<String, dynamic> _$PropertyDataToJson(PropertyData instance) =>
    <String, dynamic>{
      'content': instance.content.map((e) => e.toJson()).toList(),
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'last': instance.last,
    };

Property _$PropertyFromJson(Map<String, dynamic> json) => Property(
  id: (json['id'] as num).toInt(),
  description: json['description'] as String,
  houseType: json['houseType'] as String,
  serviceType: json['serviceType'] as String,
  location: json['location'] as String,
  price: (json['price'] as num).toDouble(),
  area: (json['area'] as num).toDouble(),
  numberOfBed: (json['numberOfBed'] as num).toInt(),
  numberOfRooms: (json['numberOfRooms'] as num).toInt(),
  numberOfBathrooms: (json['numberOfBathrooms'] as num).toInt(),
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  viewsCount: (json['viewsCount'] as num).toInt(),
  propertyImageList:
      (json['propertyImageList'] as List<dynamic>)
          .map((e) => PropertyImage.fromJson(e as Map<String, dynamic>))
          .toList(),
  office:
      json['office'] == null
          ? null
          : Office.fromJson(json['office'] as Map<String, dynamic>),
  priceInMonth: (json['priceInMonth'] as num).toDouble(),
  direction: json['direction'] as String,
);

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
  'viewsCount': instance.viewsCount,
  'propertyImageList':
      instance.propertyImageList.map((e) => e.toJson()).toList(),
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
  'office': instance.office?.toJson(),
};

PropertyImage _$PropertyImageFromJson(Map<String, dynamic> json) =>
    PropertyImage(
      id: (json['id'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$PropertyImageToJson(PropertyImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'type': instance.type,
    };

Office _$OfficeFromJson(Map<String, dynamic> json) => Office(
  id: (json['id'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  imageUrl: json['imageUrl'] as String,
  user:
      json['user'] == null
          ? null
          : UserOffice.fromJson(json['user'] as Map<String, dynamic>),
  bio: json['bio'] as String?,
  location: json['location'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  commercialRegisterImage: json['commercialRegisterImage'] as String?,
);

Map<String, dynamic> _$OfficeToJson(Office instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phone': instance.phone,
  'imageUrl': instance.imageUrl,
  'user': instance.user,
  'bio': instance.bio,
  'location': instance.location,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'commercialRegisterImage': instance.commercialRegisterImage,
};
