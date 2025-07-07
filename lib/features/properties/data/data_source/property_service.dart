import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:graduation_project/core/networks/api_constant.dart';
import '../model/propertyResponse_model.dart';

part 'property_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class PropertyService {
  factory PropertyService(Dio dio, {String? baseUrl}) = _PropertyService;

  @GET(ApiConstant.getAllProperties)
  Future<HttpResponse<PropertyResponse>> getProperties({
    @Query("page") required int page,
    @Query("size") required int size,
    @Query("sort") String sort = "price,asc",
  });
}