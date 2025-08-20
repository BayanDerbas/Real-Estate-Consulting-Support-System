import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/networks/failures.dart';
import 'package:graduation_project/features/FAQs_Support/data/data_sources/faqs_service.dart';
import 'package:graduation_project/features/FAQs_Support/data/models/faqs_response_model.dart';

class FAQsRepository{
  final FAQsService service;
  FAQsRepository(this.service);

  Future<Either<Failures,FAQsResponse>> getFAQs(int page, int size) async {
    try{
      final result = await service.getFAQs(page, size);
      return Right(result.data);
    } on DioException catch(e){
      return Left(serverFailure.fromDioError(e));
    } catch(e){
      return Left(serverFailure(e.toString()));
    }
  }
}