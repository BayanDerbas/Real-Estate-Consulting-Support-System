import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/features/posts/data/data_source/post_service.dart';

import '../../../../core/networks/failures.dart';
import '../model/create_post_request_model.dart';
import '../model/post_response_model.dart';

class PostsRepository {
  final PostService _postService;
  PostsRepository(this._postService);
  Future<Either<Failures, PostResponseModel>> addPost(
    CreatePostRequestModel request,
  ) async {
    try {
      final httpResponse = await _postService.createPost(
        request.expertId,
        request.content,
        request.image!,
      );

      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }
}
