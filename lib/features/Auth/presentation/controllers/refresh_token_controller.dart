import 'dart:developer';
import 'package:get/get.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/Auth/data/model/refresh_token_model.dart';
import '../../../../core/networks/dio_factory.dart';
import '../../data/repository/auth_repository.dart';

class RefreshTokenController extends GetxController {
  final AuthRepository _repository;
  final SecureStorage storage = SecureStorage();
  RefreshTokenController(this._repository);

  RxBool isLoading = false.obs;
  RxString errMessage = "".obs;

  Future<bool> refreshToken() async {
    isLoading.value = true;
    errMessage.value = "";

    final refreshToken = await storage.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      isLoading.value = false;
      log("Refresh Token is missing, cannot refresh.");
      return false;
    }

    final data = await _repository.refreshToken(
      RefreshRequestModel(refreshToken: refreshToken),
    );

    bool success = false;

    await data.fold(
      (l) {
        errMessage.value = l.err_message;
        log("Refresh failed: ${l.err_message}");
      },
      (r) async {
        if (r.refreshToken != null && r.token != null) {
          await storage.saveRefreshToken(r.refreshToken!);
          await storage.saveToken(r.token!);
          DioFactory.setToken(r.token!);
          log("Token refreshed successfully");
          success = true;
        } else {
          log("Refresh token response did not contain new tokens.");
        }
      },
    );

    isLoading.value = false;
    return success;
  }
}
