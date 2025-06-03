import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/features/Auth/data/model/login_model.dart';
import 'package:graduation_project/features/Auth/data/model/register_request_model.dart';
import 'package:graduation_project/core/networks/failures.dart';
import 'package:graduation_project/features/Auth/data/model/verificationcode_model.dart';

import '../data_source/auth_service/auth_service.dart';

class AuthRepository {
  final AuthService _authService;
  AuthRepository(this._authService);
  Future<Either<Failures, dynamic>> userRegister(RegisterModel request) async {
    try {
      final httpResponse = await _authService.userRegister(
        request.firstName!,
        request.lastName!,
        request.email!,
        request.password!,
        request.phone!,
        request.role!,
        "0",
        "0",
        "",
      );
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }

  Future<Either<Failures, dynamic>> userLogin(LoginRequestModel request) async {
    try {
      final httpResponse = await _authService.login(request);
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }

  Future<Either<Failures, dynamic>> verificationCode(
    VerificationCodeModel request,
  ) async {
    try {
      final httpResponse = await _authService.verificationCode(request);
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }
}
