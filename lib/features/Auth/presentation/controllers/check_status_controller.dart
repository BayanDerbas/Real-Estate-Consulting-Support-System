import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/app_keys.dart';
import 'package:graduation_project/core/utils/shard_prefs.dart';
import '../../../../core/routes/routes.dart';
import '../../data/model/change_password_model.dart';
import '../../data/repository/auth_repository.dart';

class CheckStatusController extends GetxController {
  final AuthRepository _repository;

  CheckStatusController(this._repository);

  RxBool isLoading = false.obs;
  RxString errMessage = "".obs;

  Future<void> checkStatus() async {
    isLoading(true);
    errMessage("");
    final data = await _repository.checkStatus(
      SharedPrefs.getInt(AppKeys.checkUserId) ?? 0,
    );
    data.fold((l) => errMessage(l.err_message), (r) {
      // TODO =============================== PENDING PAGE
      if (r.userStatus == "PENDING") {
        errMessage("");
      }

      // if(AVAILABLE){
      //   toRoute = AppRoutes.refreshToken;
      // }
    });
    isLoading(false);

    if (errMessage.isEmpty) {
      Get.offNamed(AppRoutes.home);
      return;
    }
  }
}
