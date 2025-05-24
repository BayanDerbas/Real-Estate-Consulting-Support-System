import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';

import '../controllers/ConfirmController.dart';
import '../widgets/Custom_Confirm.dart';

class Confirm extends StatelessWidget {
  Confirm({super.key});

  final ConfirmController controller = Get.put(ConfirmController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Confirm your reservation ",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomConfirm(
              appointementDetails: "جلسة استشارية",
              calltype: "فيديو",
              time: "30 دقيقة",
              expertName: "د. محمد أحمد",
              price: "30.00",
              dateTime: "2025-06-01 - 02:00 PM",
              sessionPrice: "30.00",
              discountRate: "0.00",
              finalPrice: "30.00",
            ),

            const SizedBox(height: 30),
            CustomButton(
              text: "تأكيد الدفع",
              backgroundColor: AppColors.deepNavy,
              textColor: AppColors.pureWhite,
              width: 375,
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}
