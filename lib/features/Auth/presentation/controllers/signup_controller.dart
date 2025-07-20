import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/shard_prefs.dart';
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
  final location = TextEditingController();
  final bio = TextEditingController();
  final profession = TextEditingController();
  final experience = TextEditingController();

  final RxString selectedRole = 'USER'.obs;

  final Rx<File?> commercialRegisterImage = Rx<File?>(null);
  final Rx<File?> idCardImage = Rx<File?>(null);
  final Rx<File?> degreeCertificateImage = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker();

  List<String> roles = ['USER', 'OFFICE', 'EXPERT'];

  onChangeRole(val) {
    selectedRole.value = val;
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> pickImage(ImageSource source, Rx<File?> fileVariable) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      fileVariable.value = File(pickedFile.path);
    } else {
      customSnackBar(title: "Info", message: "No image selected.");
    }
  }

  Future<void> userRegister() async {
    isLoading(true);
    errMessage("");

    final requestModel = RegisterModel(
      firstName: firstName.text,
      lastName: lastName.text,
      email: email.text,
      password: password.text,
      phone: phone.text,
      role: selectedRole.value,
      latitude: '0',
      location: location.text,
      longitude: '0',
      bio: bio.text,
      profession: profession.text,
      experience: experience.text,
      commercialRegisterImage: commercialRegisterImage.value,
      idCardImage: idCardImage.value,
      degreeCertificateImage: degreeCertificateImage.value,
    );

    final data = await _authRepository.userRegister(requestModel);
    isLoading(false);

    data.fold(
      (failure) {
        errMessage.value = failure.err_message;
        customSnackBar(title: "Registration Failed", message: errMessage.value);
      },
      (successModel) async {
        await SharedPrefs.saveEmail(email.text);
        print('------------------------------');
        print(await SharedPrefs.getEmail());
        errMessage.value = "";
        await AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          title: "Success",
          desc: "Account created successfully!",
          autoHide: const Duration(seconds: 2),
        ).show();

        Get.offAllNamed(
          AppRoutes.verificationCode,
          arguments: {'nextRoute': AppRoutes.login, 'email': email.text},
        );
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

  @override
  void onClose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    location.dispose();
    bio.dispose();
    profession.dispose();
    experience.dispose();
    super.onClose();
  }
}
