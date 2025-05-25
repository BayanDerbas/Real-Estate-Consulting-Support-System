import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import '../../../../core/constants/Fonts.dart';

class CustomPaymentBottomSheet extends StatelessWidget {
  final TextEditingController cardNumberController;
  final TextEditingController expiryDateController;
  final TextEditingController cvcController;
  final TextEditingController countryOrRegionController;
  final TextEditingController zipCodeController;
  final String finalPrice;
  final VoidCallback onClose;
  final VoidCallback onPay;

  const CustomPaymentBottomSheet({
    super.key,
    required this.cardNumberController,
    required this.expiryDateController,
    required this.cvcController,
    required this.countryOrRegionController,
    required this.zipCodeController,
    required this.finalPrice,
    required this.onClose,
    required this.onPay,
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
                "Add your payment information",
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
          Text(
            "Card information",
            style: Fonts.itim.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: cardNumberController,
            decoration: InputDecoration(
              hintText: "Card number",
              hintStyle: Fonts.itim.copyWith(
                fontSize: 16,
                color: AppColors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: const Icon(Icons.credit_card),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: expiryDateController,
                  decoration: InputDecoration(
                    hintText: "MM/YY",
                    hintStyle: Fonts.itim.copyWith(
                      fontSize: 16,
                      color: AppColors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: cvcController,
                  decoration: InputDecoration(
                    hintText: "CVC",
                    hintStyle: Fonts.itim.copyWith(
                      fontSize: 16,
                      color: AppColors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Billing address",
            style: Fonts.itim.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: countryOrRegionController,
            decoration: InputDecoration(
              hintText: "Country or region",
              hintStyle: Fonts.itim.copyWith(
                fontSize: 16,
                color: AppColors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: zipCodeController,
            decoration: InputDecoration(
              hintText: "ZIP code",
              hintStyle: Fonts.itim.copyWith(
                fontSize: 16,
                color: AppColors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            keyboardType: TextInputType.number,
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