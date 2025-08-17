import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/Auth/data/model/login_response_model.dart';
import 'package:graduation_project/features/Auth/data/repository/auth_repository.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../core/networks/dio_factory.dart';
import '../../../../core/networks/failures.dart';
import '../../../calls/calls_service.dart';
import '../../data/model/login_model.dart';

class LoginController extends GetxController {
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxBool isLoading = false.obs;
  final RxString errMessage = ''.obs;

  final AuthRepository _authRepository;
  final SecureStorage storage = SecureStorage();
  final CallServices callServices = CallServices();

  LoginController(this._authRepository);

  Future<void> userLogin() async {
    if (isLoading.value) return;

    isLoading.value = true;
    errMessage.value = '';
    await storage.deleteToken();
    await storage.deleteRefreshToken();
    final tok = await storage.getToken();
    print('...................delete refresh token $tok');

    final request = LoginRequestModel(
      email: email.text.trim(),
      password: password.text.trim(),
    );

    final result = await _authRepository.userLogin(request);
    isLoading.value = false;

    final context = Get.context;
    if (context == null) return;

    result.fold((failure) => _handleLoginFailure(context, failure), (
      loginData,
    ) {
      print('...........success.........');
      print(loginData);
      _handleLoginSuccess(context, loginData);
    });
  }

  Future<void> _handleLoginSuccess(BuildContext context, Data loginData) async {
    final userRoleData = loginData.userRoleData;
    LoginUser? user;
    String? id;
    if (userRoleData is LoginClient) {
      id = userRoleData.id.toString();
      user = userRoleData.user;
    } else if (userRoleData is LoginOffice) {
      id = userRoleData.id.toString();
      user = userRoleData.user;
    } else if (userRoleData is LoginExpert) {
      id = userRoleData.id.toString();
      user = userRoleData.user;
    }

    if (loginData.token == null ||
        user == null ||
        user.id == null ||
        user.role == null) {
      _showErrorDialog(
        context,
        "Login Failed",
        "Incomplete data received from the server. Please try again.",
      );
      return;
    }

    await _saveUserData(loginData, user);
    DioFactory.setToken(loginData.token!);
    final userName = "${user.firstName ?? ''} ${user.lastName ?? ''}".trim();
    await callServices.onUserLogin(user.id.toString(), userName);

    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: "Success",
      desc: "Logged in successfully!",
      btnOkOnPress: () {
        Get.offAllNamed(AppRoutes.createProperty);
      },
    ).show();
  }

  Future<void> _saveUserData(Data loginData, LoginUser user) async {
    await storage.saveToken(loginData.token!);
    if (loginData.refreshToken != null) {
      await storage.saveRefreshToken(loginData.refreshToken!);
    }

    await storage.saveUserId(user.id.toString());
    await storage.saveUserName(
      "${user.firstName ?? ''} ${user.lastName ?? ''}".trim(),
    );
    await storage.saveUserType(user.role!);
    if (user.email != null) {
      await storage.saveEmail(user.email!);
    }
    await storage.saveProfileImage(user.imageUrl ?? AppImages.user);

    final userRoleData = loginData.userRoleData;
    String? roleSpecificId;

    if (userRoleData is LoginClient) {
      roleSpecificId = userRoleData.id?.toString();
    } else if (userRoleData is LoginExpert) {
      roleSpecificId = userRoleData.id?.toString();
      if (userRoleData.idCardImage != null) {
        await storage.saveIdCardImage(userRoleData.idCardImage!);
      }
    } else if (userRoleData is LoginOffice) {
      roleSpecificId = userRoleData.id?.toString();
      if (roleSpecificId != null) {
        await storage.saveOfficeId(roleSpecificId);
      }
      if (userRoleData.commercialRegisterImage != null) {
        await storage.saveCommercialRegisterImage(
          userRoleData.commercialRegisterImage!,
        );
      }
    }

    if (roleSpecificId != null) {}
  }

  void _handleLoginFailure(BuildContext context, Failures failure) {
    errMessage.value = failure.err_message;
    _showErrorDialog(context, "Login Failed", errMessage.value);
  }

  void _showErrorDialog(
    BuildContext context,
    String title,
    String description,
  ) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: title,
      desc: description,
      btnOkOnPress: () {},
    ).show();
  }

  bool validateInput() {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      return true;
    }
    return false;
  }
}
