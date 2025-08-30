import 'dart:io';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/networks/failures.dart';

import '../../../officers/data/model/office_profile_model.dart';
import '../data_source/profile_service.dart';
import '../model/expert_profile_model.dart';
import '../model/office_profile_model.dart';

class ProfileRepository {
  final ProfileService service;

  ProfileRepository(this.service);

  Future<Either<String, ExpertProfileModel>> getExpert({
    required int id,
  }) async {
    try {
      final response = await service.getExpert(id);
      return Right(response);
    } catch (e) {
      return Left("Failed to fetch expert data: $e");
    }
  }

  Future<Either<String, OfficeProfilingModel>> getOffice({
    required int id,
  }) async {
    try {
      final response = await service.getOffice(id);
      return Right(response);
    } catch (e) {
      return Left("Failed to fetch office data: $e");
    }
  }

  Future<Either<String, Unit>> uploadUserImage(File image) async {
    try {
      final response = await service.uploadUserImage(image);

      if (response.response.statusCode == 200) {
        return const Right(unit); // success
      } else {
        return Left("Failed with status code: ${response.response.statusCode}");
      }
    } catch (e) {
      return Left("Failed to upload image: $e");
    }
  }

  Future<Either<String, Uint8List>> getExpertQr({required int expertId}) async {
    try {
      final response = await service.getExpertQr(expertId);
      return Right(Uint8List.fromList(response.data));
    } catch (e) {
      return Left("Failed to fetch QR code: $e");
    }
  }
}
