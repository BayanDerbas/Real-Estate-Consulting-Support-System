// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshRequestModel _$RefreshRequestModelFromJson(Map<String, dynamic> json) =>
    RefreshRequestModel(refreshToken: json['refreshToken'] as String?);

Map<String, dynamic> _$RefreshRequestModelToJson(
  RefreshRequestModel instance,
) => <String, dynamic>{'refreshToken': instance.refreshToken};

RefreshResponseModel _$RefreshResponseModelFromJson(
  Map<String, dynamic> json,
) => RefreshResponseModel(
  token: json['token'] as String?,
  refreshToken: json['refreshToken'] as String?,
);

Map<String, dynamic> _$RefreshResponseModelToJson(
  RefreshResponseModel instance,
) => <String, dynamic>{
  'token': instance.token,
  'refreshToken': instance.refreshToken,
};

RefreshWrappedResponse _$RefreshWrappedResponseFromJson(
  Map<String, dynamic> json,
) => RefreshWrappedResponse(
  status: json['status'] as String?,
  data:
      json['data'] == null
          ? null
          : RefreshResponseModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RefreshWrappedResponseToJson(
  RefreshWrappedResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
