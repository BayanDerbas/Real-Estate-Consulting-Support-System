import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/Auth/data/data_source/auth_service/auth_service.dart';
import 'package:graduation_project/features/Auth/data/model/verificationcode_model.dart';
import 'package:graduation_project/features/Auth/data/repository/auth_repository.dart';

import '../../../../core/routes/routes.dart';

class VerificationCodeController extends GetxController {
  final AuthRepository _authRepository;
  VerificationCodeController(this._authRepository);
  RxString errMessage = ''.obs;
  var isLoading = false.obs;
  final TextEditingController code = TextEditingController();
  final TextEditingController email = TextEditingController();
  Future<void> verificationCode() async {
    if (email.text.trim().isEmpty || code.text.trim().isEmpty) {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.warning,
        animType: AnimType.bottomSlide,
        title: "Error",
        desc: "Please fill in all fields",
        btnOkOnPress: () {},
      ).show();
      return;
    }

    isLoading(true);
    errMessage("");

    final data = await _authRepository.verificationCode(
      VerificationCodeModel(email: email.text, verificationCode: code.text),
    );

    isLoading(false);

    data.fold(
      (l) {
        errMessage(l.err_message);
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: "account has been verified successfully",
          desc: errMessage.value,
          btnOkOnPress: () {},
        ).show();
      },
      (r) {
        Get.offNamed(AppRoutes.home);
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          title: "Success",
          desc: "Account created successfully",
          btnOkOnPress: () {},
        ).show();
      },
    );
  }
}
