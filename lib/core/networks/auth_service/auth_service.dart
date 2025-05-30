import 'package:dio/dio.dart';
import 'package:graduation_project/features/Auth/data/model/login_model.dart';
import 'package:graduation_project/features/Auth/data/model/register_request_model.dart';
import 'package:retrofit/retrofit.dart';

import '../api_constant.dart';
part 'auth_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;
  @POST(ApiConstant.registerPath)
  @MultiPart()
  Future<HttpResponse<RegisterModel>> userRegister(
    @Part(name: 'firstName') String firstName,
    @Part(name: 'lastName') String lastName,
    @Part(name: 'email') String email,
    @Part(name: 'password') String password,
    @Part(name: 'phone') String phone,
    @Part(name: 'role') String? role,
  );

  @POST(ApiConstant.loginPath)
  Future<HttpResponse<LoginModel>> login(@Body() LoginModel request);
}
