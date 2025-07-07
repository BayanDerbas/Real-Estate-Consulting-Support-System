import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/networks/failures.dart';
import '../data_source/property_service.dart';
import '../model/property_model.dart';

class PropertyRepository {
  final PropertyService propertyService;

  PropertyRepository(this.propertyService);

  Future<Either<Failures, List<PropertyModel>>> getAllProperties({
    int page = 0,
    int size = 10,
  }) async {
    try {
      final response = await propertyService.getProperties(page: page, size: size);
      print("Raw Response: ${response.response.data}");
      print("Response Data: ${response.data}");

      final content = response.data.data.content ?? [];

      print("Content: $content");

      return Right(content);
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
}