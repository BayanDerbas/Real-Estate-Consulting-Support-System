import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'api_constant.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;
  @POST(ApiConstant.registerPath)
  @MultiPart()
  Future<void> register({
    @Part(name: "firstName") required String firstName,
    @Part(name: "lastName") required String lastName,
    @Part(name: "email") required String email,
    @Part(name: "password") required String password,
    @Part(name: "phone") required String phone,
    @Part(name: "role") String? role,
    @Part(name: "location") String? location,
  });
}
