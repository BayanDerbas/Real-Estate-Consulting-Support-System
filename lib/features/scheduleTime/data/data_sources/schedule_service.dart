import 'package:dio/dio.dart';
import 'package:graduation_project/features/scheduleTime/data/models/time_schedule_request.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networks/api_constant.dart';
import '../models/time_schedule_response.dart';

part 'schedule_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ScheduleService {
  factory ScheduleService(Dio dio, {String? baseUrl}) = _ScheduleService;

  @POST(ApiConstant.schedule)
  Future<ScheduleTimeResponse> createSchedule(
      @Path("id") int expertId,
      @Body() List<ScheduleTimeRequest> body,
      );
}