import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/networks/api_constant.dart';
import '../../../../core/networks/failures.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../data/model/register_request_model.dart';
import '../../data/repository/auth_repository.dart';

class RegisterController extends GetxController {
  final AuthRepository _authRepository;
  RegisterController(this._authRepository);
  var isLoading = false.obs;
  RxString errMessage = "".obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  final role = 'USER';

  var error = ''.obs;

  Future<void> userRegister() async {
    if (firstName.text.trim().isEmpty ||
        lastName.text.trim().isEmpty ||
        email.text.trim().isEmpty ||
        password.text.trim().isEmpty ||
        phone.text.trim().isEmpty) {
      customSnackBar(title: "Error", message: "Please fill in all fields");
      return;
    }
    isLoading(true);
    errMessage("");
    final data = await _authRepository.userRegister(
      RegisterModel(
        firstName: firstName.text,
        lastName: lastName.text,
        email: email.text,
        password: password.text,
        phone: phone.text,
        role: role.toString(),
      ),
    );
    data.fold((l) => errMessage(l.err_message), (r) async {
      print('successfuly');
    });
    isLoading(false);

    if (errMessage.isEmpty) {
      customSnackBar(title: "Done", message: "Account created successfully");

      return;
    }
    print(errMessage.toString());
    customSnackBar(title: "Warning", message: errMessage.value);
  }
}
