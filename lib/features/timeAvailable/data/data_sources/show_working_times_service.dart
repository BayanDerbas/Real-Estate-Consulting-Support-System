import 'package:dio/dio.dart';
import 'package:graduation_project/features/timeAvailable/data/models/delete_time_model.dart';
import 'package:graduation_project/features/timeAvailable/data/models/show_working_times_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networks/api_constant.dart';

part 'show_working_times_service.g.dart';

@RestApi(baseUrl:ApiConstant.baseUrl)
abstract class show_workingTimes_service{
  factory show_workingTimes_service(Dio dio) = _show_workingTimes_service;

  @GET(ApiConstant.working_times)
  Future<ShowAvailableTimesResponse> showWorkingTimes(@Path('id') int id);

  @DELETE(ApiConstant.delete_time)
  Future<DeleteTimeModel> delete_time(@Path('id') int id);
}