import 'package:dartz/dartz.dart';

import '../data_source/get_properties_by_officeId/properties_by_officeId_service.dart';
import '../model/get_properties_by_officeId/propertiesByOfficeId_model.dart';

class PropertyRepository {
  final PropertiesByOfficeidService service;
  PropertyRepository(this.service);

  Future<Either<String, List<Property>>> getPropertiesByOffice(
      int officeId, {int page = 0, int size = 10}
      ) async {
    try {
      final response = await service.getPropertiesByOfficeId(officeId, page, size);

      if (response.status == "success") {
        final properties = response.data.content;
        return Right(properties);
      } else {
        return Left("Failed to fetch properties");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
