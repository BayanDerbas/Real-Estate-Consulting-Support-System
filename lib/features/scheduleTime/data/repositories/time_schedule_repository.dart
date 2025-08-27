import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/networks/failures.dart';
import 'package:graduation_project/features/scheduleTime/data/data_sources/schedule_service.dart';
import 'package:graduation_project/features/scheduleTime/data/models/time_schedule_data.dart';
import 'package:graduation_project/features/scheduleTime/data/models/time_schedule_request.dart';

class ScheduleTimeRepository{
  final ScheduleService service;

  ScheduleTimeRepository(this.service);

  Future<Either<Failures,List<ScheduleTimeData>>> create_schedule({
   required int expertId,
    required List<ScheduleTimeRequest> body,
  }) async {
    try{
      final result = await service.createSchedule(expertId, body);
      return Right(result.data!);
    } catch(e){
      return Left(serverFailure(e.toString()));
    }
}
}