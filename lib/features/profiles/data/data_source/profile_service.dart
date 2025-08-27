import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networks/api_constant.dart';

import '../model/expert_profile_model.dart';

part 'profile_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ProfileService {
  factory ProfileService(Dio dio, {String baseUrl}) = _ProfileService;

  @GET("/experts/{id}")
  Future<ExpertProfileModel> getExpert(@Path("id") int id);
  @GET("/offices/{id}")
  @POST('/users/upload-image')
  @MultiPart()
  @Headers(<String, dynamic>{"Content-Type": "multipart/form-data"})
  Future<HttpResponse<void>> uploadUserImage(@Part(name: "image") File? image);
  // @GET("/qr-code/{expertId}")
  // @DioResponseType(ResponseType.bytes)
  // @Headers({"accept": "image/png"})
  // Future<HttpResponse<Uint8List>> getExpertQr(@Path("expertId") int expertId);
}
