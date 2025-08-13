import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networks/api_constant.dart';
import '../models/myReserve_response.dart';

part 'myReserve_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class MyReserveService {
  factory MyReserveService (Dio dio) = _MyReserveService;

  @GET(ApiConstant.showMyReserve)
  Future<MyReserveResponse> getReservationsByStatus(@Path('status') String status);
}