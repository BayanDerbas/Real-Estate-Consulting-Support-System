import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../../../../core/constants/image_paths.dart';

class CustomWallet extends StatelessWidget {
  final String totalBalance;
  final VoidCallback? onDeposit;
  final VoidCallback? onCharge;
  final VoidCallback? onWithdraw;
  final bool isDepositSelected;
  final bool isChargeSelected;
  final bool isWithDrawSelected;
  final bool isExpert;

  const CustomWallet({
    super.key,
    required this.totalBalance,
    this.onDeposit,
    this.onCharge,
    this.onWithdraw,
    this.isDepositSelected = false,
    this.isChargeSelected = false,
    this.isWithDrawSelected = false,
    this.isExpert = false,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 400,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 5),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage(AppImages.walletBackground),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total balance",
                  style: Fonts.itim.copyWith(
                    color: AppColors.pureWhite,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "$totalBalance \$",
                  style: Fonts.itim.copyWith(
                    color: AppColors.pureWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onDeposit,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color:
                            isDepositSelected
                                ? AppColors.deepNavy
                                : Colors.transparent,
                        border: Border.all(color: AppColors.deepNavy, width: 3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(18),
                      child: Icon(
                        Icons.add,
                        color:
                            isDepositSelected
                                ? AppColors.pureWhite
                                : AppColors.deepNavy,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Deposit",
                      style: Fonts.itim.copyWith(color: AppColors.deepNavy),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30),
              GestureDetector(
                onTap: onCharge,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color:
                            isChargeSelected
                                ? AppColors.deepNavy
                                : Colors.transparent,
                        border: Border.all(color: AppColors.deepNavy, width: 3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(18),
                      child: Icon(
                        Icons.attach_money_outlined,
                        color:
                            isChargeSelected
                                ? AppColors.pureWhite
                                : AppColors.deepNavy,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "charge",
                      style: Fonts.itim.copyWith(color: AppColors.deepNavy),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30),
// التعديل على زر Withdraw فقط

              if (isExpert)
                GestureDetector(
                  onTap: onWithdraw,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: isWithDrawSelected
                              ? AppColors.deepNavy
                              : Colors.transparent,
                          border: Border.all(color: AppColors.deepNavy, width: 3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(18),
                        child: Icon(
                          Icons.arrow_outward_rounded,
                          color: isWithDrawSelected
                              ? AppColors.pureWhite
                              : AppColors.deepNavy,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Withdraw",
                        style: Fonts.itim.copyWith(
                          color: isWithDrawSelected
                              ? AppColors.deepNavy
                              : AppColors.deepNavy,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ).padding(const EdgeInsets.all(16)),
    );
  }
}
