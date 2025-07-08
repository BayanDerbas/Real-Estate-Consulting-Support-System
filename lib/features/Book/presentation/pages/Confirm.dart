import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import '../controllers/ConfirmController.dart';
import '../controllers/PayementController.dart';
import '../widgets/Custom_Confirm.dart';
import '../widgets/Custom_PaymentBottomSheet.dart';

class Confirm extends StatelessWidget {
  Confirm({super.key});

  final ConfirmController confirmController = Get.put(ConfirmController());
  final PaymentController paymentController = Get.put(PaymentController());

  void _showPaymentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return CustomPaymentBottomSheet(
          cardNumberController: paymentController.cardNumberController,
          expiryDateController: paymentController.expiryDateController,
          cvcController: paymentController.cvcController,
          countryOrRegionController:
              paymentController.countryOrRegionController,
          zipCodeController: paymentController.zipCodeController,
          finalPrice: "30.00",
          onClose: () {
            paymentController.clearFields();
            Navigator.pop(context);
          },
          onPay: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Payment Successful!")),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Confirm your reservation ",
          icon: Icon(Icons.notifications),
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomConfirm(
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
              text: "الدفع وتأكيد الحجز",
              backgroundColor: AppColors.deepNavy,
              textColor: AppColors.pureWhite,
              width: 375,
              onPressed: () {
                _showPaymentBottomSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
