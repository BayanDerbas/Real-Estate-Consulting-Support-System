import 'package:dartz/dartz.dart';
import '../data_source/office_service.dart';
import '../model/offices_response.dart';

class OfficeRepository {
  final OfficeService service;

  OfficeRepository(this.service);

  Future<Either<String, OfficesResponse>> getAllOffices() async {
    try {
      final response = await service.getAllOffices();
      return Right(response);
    } catch (e) {
      return Left("Failed to fetch offices: $e");
    }
  }
}
