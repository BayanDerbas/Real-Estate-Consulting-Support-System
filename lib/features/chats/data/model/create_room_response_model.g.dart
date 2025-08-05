// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_room_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRoomResponseModel _$CreateRoomResponseModelFromJson(
  Map<String, dynamic> json,
) => CreateRoomResponseModel(
  user1:
      json['user1'] == null
          ? null
          : UserModel.fromJson(json['user1'] as Map<String, dynamic>),
  user2:
      json['user2'] == null
          ? null
          : UserModel.fromJson(json['user2'] as Map<String, dynamic>),
  id: (json['id'] as num?)?.toInt(),
  status: json['status'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$CreateRoomResponseModelToJson(
  CreateRoomResponseModel instance,
) => <String, dynamic>{
  'user1': instance.user1,
  'user2': instance.user2,
  'id': instance.id,
  'status': instance.status,
  'createdAt': instance.createdAt,
};

CreateRoomApiResponse _$CreateRoomApiResponseFromJson(
  Map<String, dynamic> json,
) => CreateRoomApiResponse(
  status: json['status'] as String?,
  data:
      json['data'] == null
          ? null
          : CreateRoomResponseModel.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$CreateRoomApiResponseToJson(
  CreateRoomApiResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
