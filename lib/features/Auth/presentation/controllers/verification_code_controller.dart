import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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

  late Timer _timer;
  var canResend = false.obs;
  var countdown = 60.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is String) {
      email.text = Get.arguments;
    }
    startResendTimer();
  }

  void startResendTimer() {
    canResend(false);
    countdown.value = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        _timer.cancel();
        canResend(true);
      }
    });
  }

  Future<void> resendCode() async {
    print("Resending code to ${email.text}...");
    startResendTimer();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  Future<void> verificationCode() async {
    if (code.text.trim().isEmpty) {
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
          title: "Verification Failed",
          desc: errMessage.value,
          btnOkOnPress: () {},
        ).show();
      },
      (r) async {
        await AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          title: "Success",
          desc: "Account created successfully",
          btnOkOnPress: () {},
          autoHide: Duration(seconds: 2),
        ).show();
        _timer.cancel();
        Get.offNamed(AppRoutes.home);
      },
    );
  }
}
