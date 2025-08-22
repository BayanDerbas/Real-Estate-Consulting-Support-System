import 'package:dio/dio.dart';
import 'package:graduation_project/features/Book/data/model/get_working_times/working_times_response.dart';
import 'package:graduation_project/features/Book/data/model/reservation_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../../core/networks/api_constant.dart';

part 'reservation_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ReservationService {
  factory ReservationService(Dio dio, {String baseUrl}) = _ReservationService;

  @GET(ApiConstant.reservation_allready)
  Future<ReservationResponse> getReservations(@Path("id") int expertId);
  @GET(ApiConstant.working_times)
  Future<WorkingTimesResponse> getWorkingTimes(@Path("id") int expertId);
}
