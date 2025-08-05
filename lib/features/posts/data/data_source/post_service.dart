import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networks/api_constant.dart';
import '../model/post_response_model.dart';

part 'post_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class PostService {
  factory PostService(Dio dio) = _PostService;

  @POST("/posts")
  @MultiPart()
  Future<HttpResponse<PostResponseModel>> createPost(
    @Part(name: "expertId") int expertId,
    @Part(name: "content") String content,
    @Part(name: "image") File image,
  );
}
