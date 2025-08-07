import 'package:dio/dio.dart';
import 'package:graduation_project/features/properties/data/model/create_property_request_model.dart';
import 'package:graduation_project/features/properties/data/model/create_property_response_model.dart';
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
  @POST(ApiConstant.createProperty)
  Future<HttpResponse<CreatePropertyResponseModel>> createProperty(
    @Body() CreatePropertyRequestModel request,
  );
}
