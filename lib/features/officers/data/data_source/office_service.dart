import 'package:dio/dio.dart';
import 'package:graduation_project/core/networks/api_constant.dart';
import 'package:graduation_project/features/officers/data/model/office_profile_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../model/offices_response.dart';

part 'office_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class OfficeService {
  factory OfficeService(Dio dio) = _OfficeService;

  @GET(ApiConstant.getAllOffices)
  Future<OfficesResponse> getAllOffices({
    @Query("page") int page = 0,
    @Query("size") int size = 10,
  });
  @GET('offices/{id}')
  Future<HttpResponse<OfficeProfileModel>> getOfficeProfile(@Path("id") int id);
}
