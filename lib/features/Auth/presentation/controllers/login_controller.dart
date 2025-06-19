import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/Auth/data/model/login_model.dart';
import 'package:graduation_project/features/Auth/data/repository/auth_repository.dart';

import '../../../../core/widgets/custom_snack_bar.dart';

class LoginController extends GetxController {
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  RxString errMessage = ''.obs;
  var isLoading = false.obs;
  final AuthRepository _authRepository;
  LoginController(this._authRepository);
  Future<void> userLogin() async {
    if (email.text.trim().isEmpty || password.text.trim().isEmpty) {
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

    final data = await _authRepository.userLogin(
      LoginRequestModel(email: email.text, password: password.text),
    );

    isLoading(false);

    data.fold(
      (l) {
        errMessage(l.err_message);
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: "Login Failed",
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
          autoHide: Duration(seconds: 2),
        ).show();
      },
    );
  }
}
