import 'package:dio/dio.dart';
import 'package:graduation_project/core/networks/api_constant.dart';
import 'package:graduation_project/features/notification/data/models/notifications_response.dart';
import 'package:retrofit/retrofit.dart';

part 'notification_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class NotificationService {
  factory NotificationService(Dio dio, {String baseUrl}) = _NotificationService;

  @GET(ApiConstant.notifications)
  Future<NotificationsResponse> getMyNotification(
      @Query("page") int page,
      @Query("size") int size,
      );
}