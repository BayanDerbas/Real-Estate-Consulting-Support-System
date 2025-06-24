import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/Auth/data/model/change_password_model.dart';
import 'package:graduation_project/features/Auth/data/repository/auth_repository.dart';

class ChangePasswordController extends GetxController {
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  RxString errMessage = ''.obs;
  var isLoading = false.obs;
  final AuthRepository _authRepository;
  ChangePasswordController(this._authRepository);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> changePassword() async {
    isLoading(true);
    errMessage("");

    final data = await _authRepository.changePassword(
      ChangePasswordModel(email: email.text, password: password.text),
    );

    isLoading(false);

    data.fold(
      (l) {
        errMessage(l.err_message);
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: "Change Password Failed",
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
          desc: "Password changed successfully",
          btnOkOnPress: () {},
          autoHide: const Duration(seconds: 2),
        ).show();
      },
    );
  }

  bool validateInput() {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      return true;
    }
    return false;
  }
}
