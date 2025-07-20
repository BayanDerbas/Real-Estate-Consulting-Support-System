import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/routes/routes.dart';
import '../../data/model/change_password_model.dart';
import '../../data/repository/auth_repository.dart';

class ChangePasswordController extends GetxController {
  final AuthRepository _authRepository;
  ChangePasswordController(this._authRepository);

  final TextEditingController password = TextEditingController();
  late String userEmail;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxString errMessage = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map && args['email'] != null) {
      userEmail = args['email'];
    } else {
      userEmail = '';
    }
  }

  Future<void> changePassword() async {
    if (!formKey.currentState!.validate()) return;

    isLoading(true);
    errMessage("");

    final result = await _authRepository.changePassword(
      ChangePasswordModel(email: userEmail, password: password.text.trim()),
    );

    isLoading(false);

    result.fold(
      (failure) {
        errMessage(failure.err_message);
        if (Get.context != null) {
          AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: "Change Password Failed",
            desc: errMessage.value,
            btnOkOnPress: () {},
          ).show();
        }
      },
      (_) {
        if (Get.context != null) {
          AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.success,
            animType: AnimType.scale,
            title: "Success",
            desc: "Password changed successfully.",
            autoHide: const Duration(seconds: 2),
            onDismissCallback: (type) {
              Get.offAllNamed(AppRoutes.login);
            },
          ).show();
        }
      },
    );
  }

  @override
  void onClose() {
    password.dispose();
    super.onClose();
  }
}
