import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networks/api_constant.dart';
import '../models/myBookings/my_bookings_model.dart';

part 'myBookings_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class MyBookingsApi {
  factory MyBookingsApi(Dio dio, {String baseUrl}) = _MyBookingsApi;

  @GET(ApiConstant.showMyAppointement)
  Future<MyBookingsResponse> getMyBookings(@Path("status") String status);
}