import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/WalletController.dart';
import '../widgets/Custom_Wallet.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    final WalletController controller = Get.put(WalletController());
    controller.setUserType('expert');

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Wallet",
          icon: Icon(Icons.notifications), 
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Obx(
        () => CustomWallet(
          totalBalance: "60.00",
          isExpert: controller.isExpert,
          onDeposit: () {
            controller.selectDeposit();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Deposit Successful!")),
            );
          },
          onCharge: () {
            controller.selectCharge();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Charge Successful!")));
          },
          onWithdraw: () {
            controller.selectWithdraw();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Withdraw Successful!")),
            );
          },
          isDepositSelected: controller.selectedButton.value == 1,
          isChargeSelected: controller.selectedButton.value == 2,
          isWithDrawSelected: controller.selectedButton.value == 3,
        ),
      ),
    );
  }
}
