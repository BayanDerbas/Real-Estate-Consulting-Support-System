import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import '../../../../core/constants/Fonts.dart';

class CustomPaymentBottomSheet extends StatelessWidget {
  final String finalPrice;
  final VoidCallback onClose;
  final VoidCallback onPay;
  final String clientSecret;

  const CustomPaymentBottomSheet({
    super.key,
    required this.finalPrice,
    required this.onClose,
    required this.onPay,
    required this.clientSecret,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.softWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "تأكيد الحجز والدفع",
                  style: Fonts.itim.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.deepNavy,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: AppColors.darkGray),
                  onPressed: onClose,
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: "ادفع \$${finalPrice}",
                backgroundColor: AppColors.deepNavy,
                textColor: AppColors.pureWhite,
                onPressed: onPay,
                width: 175,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
