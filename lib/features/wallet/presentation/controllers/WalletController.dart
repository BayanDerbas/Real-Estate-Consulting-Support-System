import 'package:get/get.dart';

class WalletController extends GetxController {
  var selectedButton = 0.obs;
  var userType = ''.obs;

  void selectDeposit() => selectedButton.value = 1;

  void selectCharge() => selectedButton.value = 2;

  void selectWithdraw() => selectedButton.value = 3;

  bool get isExpert => userType.value == 'user';

  void setUserType(String type) {
    userType.value = type;
  }
}
