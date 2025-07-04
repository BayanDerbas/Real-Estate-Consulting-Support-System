import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/Auth/data/model/login_model.dart';
import 'package:graduation_project/features/Auth/data/repository/auth_repository.dart';

import '../../../../core/networks/dio_factory.dart';

class LoginController extends GetxController {
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final RxString errMessage = ''.obs;
  final RxBool isLoading = false.obs;
  final AuthRepository _authRepository;
  final SecureStorage storage = SecureStorage();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginController(this._authRepository);

  Future<void> userLogin() async {
    isLoading.value = true;
    errMessage.value = '';

    final result = await _authRepository.userLogin(
      LoginRequestModel(email: email.text, password: password.text),
    );

    isLoading.value = false;

    final context = Get.context;
    if (context == null) return;

    result.fold(
      (failure) {
        errMessage.value = failure.err_message;
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: "Login Failed",
          desc: errMessage.value,
          btnOkOnPress: () {},
        ).show();
      },
      (response) async {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          title: "Success",
          desc: "Logged in successfully",
          btnOkOnPress: () {},
          autoHide: Duration(seconds: 2),
        ).show();

        if (response.token != null) {
          print('if token dosnt null will show : ........');
          print(await storage.getToken());
          print(await storage.getUserId());
          DioFactory.setToken(response.token!);
          await storage.saveUserId(response.user!.id.toString());
        }
        if (response.refreshToken != null) {
          await storage.saveRefreshToken(response.refreshToken!);
        }
        await Future.delayed(Duration(seconds: 2));
        Get.offNamed(AppRoutes.allTickets);
        final userId = await storage.getUserId();
        print("the user id .............$userId");
      },
    );
  }

  bool validateInput() {
    final formData = formKey.currentState;
    return formData?.validate() ?? false;
  }
}
