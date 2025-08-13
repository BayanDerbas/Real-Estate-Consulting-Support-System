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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Confirm Reservation and Payement",
                style: Fonts.itim.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: onClose,
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: "Pay \$${finalPrice}",
              backgroundColor: AppColors.deepNavy,
              textColor: AppColors.pureWhite,
              onPressed: onPay,
              width: 175,
            ),
          ),
        ],
      ),
    );
  }
}