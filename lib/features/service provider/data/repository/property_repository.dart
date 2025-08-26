import 'package:dartz/dartz.dart';
import '../model/get_properties_by_officeId/propertiesByOfficeId_model.dart';

class PropertyRepository {
  final PropertiesByOfficeidService service;
  PropertyRepository(this.service);

  Future<Either<String, List<Property>>> getPropertiesByOffice(
    int officeId, {
    int page = 0,
    int size = 10,
  }) async {
    try {
      final response = await service.getPropertiesByOffice(
        officeId,
        page,
        size,
      );
      if (response.response.statusCode == 200 &&
          response.data["status"] == "success") {
        final content = response.data["data"]["content"] as List;
        final properties = content.map((e) => Property.fromJson(e)).toList();
        return Right(properties);
      } else {
        return Left("Failed to fetch properties");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
