import 'dart:developer';

import 'package:get/get.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/Auth/data/model/refresh_token_model.dart';
import 'package:graduation_project/features/Auth/data/repository/auth_repository.dart';

import '../../../../core/networks/dio_factory.dart';

class RefreshTokenController extends GetxController {
  final AuthRepository _repository;

  RefreshTokenController(this._repository);

  RxBool isLoading = false.obs;
  RxString errMessage = "".obs;

  Future<void> refreshToken() async {
    isLoading(true);
    errMessage("");
    final data = await _repository.refreshToken(
      RefreshRequestModel(
        refreshToken: await SecureStorage().getRefreshToken(),
      ),
    );
    data.fold((l) => errMessage(l.err_message), (r) {
      log("token: ${r.token}");
      SecureStorage storage = SecureStorage();
      storage.saveToken(r.token!);
      storage.saveRefreshToken(r.refreshToken!);

      DioFactory.setToken(r.token!);
    });
    isLoading(false);

    if (errMessage.isEmpty) {
      Get.offNamed(AppRoutes.home);
      return;
    }
  }
}
