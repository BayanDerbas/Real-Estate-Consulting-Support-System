import 'package:json_annotation/json_annotation.dart';
import 'package:graduation_project/core/pagination/models/pagination_response.dart';
import 'package:graduation_project/features/notification/data/models/notification_model.dart';

part 'notifications_response.g.dart';

@JsonSerializable()
class NotificationsResponse {
  final PaginationResponse<NotificationModel>? data;

  NotificationsResponse({this.data});

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsResponseToJson(this);
}