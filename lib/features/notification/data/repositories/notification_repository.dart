import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/networks/failures.dart';
import 'package:graduation_project/core/pagination/models/pagination_response.dart';
import 'package:graduation_project/features/notification/data/data_sources/notification_service.dart';
import 'package:graduation_project/features/notification/data/models/notification_model.dart';

class NotificationRepository{
  final NotificationService service;

  NotificationRepository(this.service);

  Future<Either<Failures, PaginationResponse<NotificationModel>>> getMyNotification({
    int page = 0,
    int size = 5,
  }) async {
    try{
      final reponse = await service.getMyNotification(page, size);
      return Right(reponse.data!);
    } catch(e){
      return Left(serverFailure(e.toString()));
    }
  }
}