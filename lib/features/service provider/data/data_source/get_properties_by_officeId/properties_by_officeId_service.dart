import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networks/api_constant.dart';
import '../../model/get_properties_by_officeId/propertiesByOfficeId_model.dart';

part 'properties_by_officeId_service.g.dart';


@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class PropertiesByOfficeidService {
  factory PropertiesByOfficeidService(Dio dio, {String baseUrl}) = _PropertiesByOfficeidService;

  @GET("/properties/office/{officeId}")
  Future<PropertiesByOfficeIdResponse> getPropertiesByOfficeId(
      @Path("officeId") int officeId,
      @Query("page") int page,
      @Query("size") int size,
      );
}