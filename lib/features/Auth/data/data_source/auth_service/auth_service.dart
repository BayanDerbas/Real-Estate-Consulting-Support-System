import 'package:dio/dio.dart' hide Headers;
import 'package:graduation_project/features/Auth/data/model/login_model.dart';
import 'package:graduation_project/features/Auth/data/model/register_request_model.dart';
import 'package:graduation_project/features/Auth/data/model/verificationcode_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networks/api_constant.dart';
import 'dart:io';
part 'auth_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;
  @POST(ApiConstant.registerPath)
  @MultiPart()
  @Headers(<String, dynamic>{"Content-Type": "multipart/form-data"})
  Future<HttpResponse<RegisterModel>> userRegister(
    // @Part(name: "commercialRegisterImage") MultiPartFile,
    @Part(name: 'firstName') String firstName,
    @Part(name: 'lastName') String lastName,
    @Part(name: 'email') String email,
    @Part(name: 'password') String password,
    @Part(name: 'phone') String phone,
    @Part(name: 'role') String role,
    @Part(name: 'latitude') String? latitude,
    @Part(name: 'longitude') String? longitude,
    @Part(name: 'location') String? location,
    @Part(name: "commercialRegisterImage") File? commercialRegisterImage,
    @Part(name: "idCardImage") File? idCardImage,
    @Part(name: "degreeCertificateImage") File? degreeCertificateImage,
    @Part(name: 'profession') String? profession,
    @Part(name: 'experience') String? experience,
    @Part(name: 'bio') String? bio,
  );

  @POST(ApiConstant.loginPath)
  Future<HttpResponse<LoginResponseModel>> login(
    @Body() LoginRequestModel request,
  );
  @POST(ApiConstant.verificationCode)
  Future<HttpResponse<VerificationCodeModel>> verificationCode(
    @Body() VerificationCodeModel request,
  );
}
