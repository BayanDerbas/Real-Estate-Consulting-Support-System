// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsResponse _$NotificationsResponseFromJson(
  Map<String, dynamic> json,
) => NotificationsResponse(
  data:
      json['data'] == null
          ? null
          : PaginationResponse<NotificationModel>.fromJson(
            json['data'] as Map<String, dynamic>,
            (value) =>
                NotificationModel.fromJson(value as Map<String, dynamic>),
          ),
);

Map<String, dynamic> _$NotificationsResponseToJson(
  NotificationsResponse instance,
) => <String, dynamic>{'data': instance.data?.toJson((value) => value)};
