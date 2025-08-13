import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/Auth/data/model/login_model.dart';
import 'package:graduation_project/features/Auth/data/repository/auth_repository.dart';
import 'package:graduation_project/features/officers/data/model/office.dart';
import 'package:graduation_project/features/service%20provider/data/model/expert.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../core/networks/dio_factory.dart';
import '../../../calls/calls_service.dart';

class LoginController extends GetxController {
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final RxString errMessage = ''.obs;
  final RxBool isLoading = false.obs;
  final AuthRepository _authRepository;
  final SecureStorage storage = SecureStorage();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CallServices callServices = CallServices();
  LoginController(this._authRepository);

  Future<void> userLogin() async {
    isLoading.value = true;
    errMessage.value = '';

    final result = await _authRepository.userLogin(
      LoginRequestModel(
        email: email.text.trim(),
        password: password.text.trim(),
      ),
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
          await storage.saveToken(response.token!);
          await storage.saveUserId(response.user!.id.toString());
          await storage.saveUserIdByRole(
            response.user!.id.toString(),
            response.user!.role!,
          );
          await storage.saveUserName(
            "${response.user!.firstName ?? ''} ${response.user!.lastName ?? ''}",
          );
          await storage.saveUserType(response.user!.role!);
          await storage.saveEmail(response.user!.email.toString());
          final userRole = response.user!.role!;
          String imageStore = "";
          switch (userRole) {
            case "EXPERT":
              imageStore = response.expert?.idCardImage ?? AppImages.user;
              await storage.saveIdCardImage(imageStore);
              break;
            case "OFFICE":
              imageStore = response.office?.commercialRegisterImage ?? AppImages.user;
              await storage.saveCommercialRegisterImage(imageStore);
              break;
            case "USER":
            default:
              imageStore = response.user?.imageUrl ?? AppImages.user;
              await storage.saveProfileImage(imageStore);
              break;
          }

          print('\nToken has been saved. Now printing it:');
          print(await storage.getToken());
          print(await storage.getUserId());

          DioFactory.setToken(response.token!);
          final currentUserName = await storage.getUserName();
          final currentUserId = await storage.getUserId();
          if (currentUserId != null && currentUserName != null) {
            await callServices.onUserLogin(currentUserId, currentUserName);
          }
        }
        if (response.refreshToken != null) {
          //  Get.toNamed(AppRoutes.login);
          await storage.saveRefreshToken(response.refreshToken!);
        }

        await Future.delayed(Duration(seconds: 2));
        Get.offNamed(AppRoutes.baseTicketsPage);

        final userId = await storage.getUserId();
        final currentClientId = await storage.getIdByRole();
        print("the user id .............$userId\n");
        print(("the client id ....................................$currentClientId"));
      },
    );
  }

  bool validateInput() {
    final formData = formKey.currentState;
    return formData?.validate() ?? false;
  }
}
