import 'package:dio/dio.dart';
import 'package:graduation_project/core/networks/api_constant.dart';
import 'package:retrofit/http.dart';
import '../model/offices_response.dart';

part 'office_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class OfficeService {
  factory OfficeService(Dio dio, {String baseUrl}) = _OfficeService;

  @GET(ApiConstant.getAllOffices)
  Future<OfficesResponse> getAllOffices({
    @Query("page") int page = 0,
    @Query("size") int size = 10,
  });
}
