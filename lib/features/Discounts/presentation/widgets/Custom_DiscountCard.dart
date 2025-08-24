import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';

class CustomDiscountCard extends StatelessWidget {
  final Map<String, dynamic> discountData;
  final Color cardColor;
  final VoidCallback onDelete;

  const CustomDiscountCard({
    super.key,
    required this.discountData,
    required this.cardColor,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCodeDiscount = discountData['isCodeDiscount'] ?? true;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 300,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.card_giftcard, color: AppColors.pureWhite, size: 40),
                  ],
                ),
                const SizedBox(height: 8),
                if (isCodeDiscount) ...[
                  Text(
                    "كود: ${discountData['code'] ?? ''}",
                    style: Fonts.taj.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.pureWhite,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "المبلغ: ${discountData['amount'] ?? ''}",
                    style: Fonts.taj.copyWith(
                      fontSize: 14,
                      color: AppColors.pureWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "الصلاحية: ${discountData['validity'] ?? ''} مرات",
                    style: Fonts.taj.copyWith(
                      fontSize: 14,
                      color: AppColors.pureWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ] else ...[
                  Text(
                    "عدد الجلسات: ${discountData['sessionsBeforeDiscount'] ?? ''}",
                    style: Fonts.taj.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.pureWhite,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "نسبة الخصم: ${discountData['discountPercentage'] ?? ''}%",
                    style: Fonts.taj.copyWith(
                      fontSize: 14,
                      color: AppColors.pureWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "تاريخ الصلاحية: ${discountData['expiryDate'] ?? ''}",
                    style: Fonts.taj.copyWith(
                      fontSize: 14,
                      color: AppColors.pureWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Text(
                  "الوصف: ${discountData['description'] ?? ''}",
                  style: Fonts.taj.copyWith(
                    fontSize: 14,
                    color: AppColors.pureWhite,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    icon: const Icon(Icons.delete, color: AppColors.red, size: 30),
                    onPressed: onDelete,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
