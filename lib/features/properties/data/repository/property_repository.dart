import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/networks/failures.dart';
import '../data_source/property_service.dart';
import '../model/create_property_request_model.dart';
import '../model/create_property_response_model.dart';
import '../model/propertyResponse_model.dart';

class PropertyRepository {
  final PropertyService propertyService;

  PropertyRepository(this.propertyService);

  Future<Either<Failures, PropertyResponse>> getAllProperties({
    int page = 0,
    int size = 10,
    String? type,
  }) async {
    try {
      final response = await propertyService.getProperties(
        page: page,
        size: size,
        type: type,
      );
      print("Raw Response: ${response.response.data}");
      print("Response Data: ${response.data}");

      final propertyResponse = response.data;

      print("Content: ${propertyResponse.data.content}");

      return Right(propertyResponse);
    } catch (e) {
      print("......................................................");
      print("Failed to fetch data");
      print("Error: $e");
      if (e is DioException) {
        print("DioException Details: ${e.response?.data}");
        return Left(serverFailure(
          e.response?.data?.toString() ?? e.message ?? 'Unknown error',
        ));
      }
      return Left(serverFailure(e.toString()));
    }
  }
  Future<Either<Failures, CreatePropertyResponseModel>> createProperty(
      CreatePropertyRequestModel request,
      ) async {
    try {
      final httpResponse = await propertyService.createProperty(request);
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }
}