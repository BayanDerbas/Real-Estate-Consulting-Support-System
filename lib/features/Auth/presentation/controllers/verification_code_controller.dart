import 'dart:async';
import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/app_keys.dart';
import 'package:graduation_project/core/utils/shard_prefs.dart';
import 'package:graduation_project/features/Auth/data/model/verificationcode_model.dart';
import 'package:graduation_project/features/Auth/data/repository/auth_repository.dart';
import '../../../../core/routes/routes.dart';

class VerificationCodeController extends GetxController {
  final AuthRepository _authRepository;
  VerificationCodeController(this._authRepository);

  RxString errMessage = ''.obs;
  var isLoading = false.obs;
  final TextEditingController code = TextEditingController();
  late var email = SharedPrefs.getEmail();

  late Timer _timer;
  var canResend = false.obs;
  var countdown = 20.obs;
  late String nextRoute;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is Map) {
      nextRoute = Get.arguments['nextRoute'] ?? AppRoutes.login;
    } else {
      nextRoute = AppRoutes.login;
    }
    startResendTimer();
  }

  void startResendTimer() {
    canResend(false);
    countdown.value = 20;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        timer.cancel();
        canResend(true);
      }
    });
  }

  Future<void> sendCode() async {
    isLoading(true);
    final data = await _authRepository.sendCode(email);
    isLoading(false);
    data.fold(
      (l) {
        errMessage(l.err_message);
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: "Sending Failed",
          desc: errMessage.value,
          btnOkOnPress: () {},
        ).show();
      },
      (r) async {
        print('.................verification body');
        log(email!);
        log(code.text);
        code.clear();
        await AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          title: "Success",
          desc: "New code sent successfully",
          btnOkOnPress: () {},
          autoHide: const Duration(seconds: 4),
        ).show();
        startResendTimer();
      },
    );
  }

  Future<void> verificationCode() async {
    if (code.text.trim().isEmpty) return;

    isLoading(true);
    errMessage("");

    final data = await _authRepository.verificationCode(
      VerificationCodeModel(email: email, verificationCode: code.text),
    );

    isLoading(false);
    log(data.toString());
    data.fold(
      (l) {
        log('verification >>>>>>>>>>>>>>>>');
        log('email ');
        log(email!);
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
        _timer.cancel();

        // TODO add logic to go to check status page
        // SharedPrefs.saveString(AppKeys.toRoute, "/check-status-page");
        // Get.offAllNamed("/check-status-page")

        Get.offNamed(nextRoute);
      },
    );
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
