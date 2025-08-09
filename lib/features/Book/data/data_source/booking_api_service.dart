import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networks/api_constant.dart';
import '../model/booking_request_model.dart';
import '../model/booking_response.dart';

part 'booking_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class BookingService {
  factory BookingService(Dio dio) = _BookingService;

  @POST('/booking')
  Future<BookingResponse> createBooking(@Body() BookingRequest request);
}