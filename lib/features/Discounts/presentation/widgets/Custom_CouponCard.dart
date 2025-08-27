import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';

class CustomCouponCard extends StatelessWidget {
  final String code;
  final String description;
  final String discountValue;
  final String? expirationDate;
  final int? maxUses;
  final int? timesUsed;
  final String? expertName;
  final String? createdAt;
  final Color color;

  static List<Color> discountColors = [
    AppColors.lavender,
    AppColors.softPink,
    AppColors.babySky,
    AppColors.aquaBlue,
    AppColors.goldenYellow,
    AppColors.blushRose,
  ];

  const CustomCouponCard({
    super.key,
    required this.code,
    required this.description,
    required this.discountValue,
    this.expirationDate,
    this.maxUses,
    this.timesUsed,
    this.expertName,
    this.createdAt,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Code : ${code}", style: Fonts.itim.copyWith(fontSize: 18)),
          const SizedBox(height: 4),
          Text(
            description,
            style: Fonts.taj.copyWith(
              color: AppColors.pureWhite,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 4),
          Text(
            "Discount: $discountValue",
            style: Fonts.itim.copyWith(fontSize: 14),
          ),
          if (expirationDate != null)
            Text(
              "Expires: $expirationDate",
              style: Fonts.taj.copyWith(
                fontSize: 12,
                color: AppColors.pureWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (maxUses != null && timesUsed != null)
            Text(
              "Uses: $timesUsed / $maxUses",
              style: Fonts.taj.copyWith(
                fontSize: 13,
                color: AppColors.pureWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (expertName != null)
            Text(
              "name: $expertName",
              style: Fonts.taj.copyWith(
                fontSize: 13,
                color: AppColors.pureWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (createdAt != null)
            Text(
              "Created: ${formatDateTime(createdAt!)}",
              style: Fonts.taj.copyWith(
                fontSize: 13,
                color: AppColors.pureWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}

String formatDateTime(String dateTimeString) {
  try {
    DateTime dt = DateTime.parse(dateTimeString);
    return DateFormat('yyyy-MM-dd HH:mm').format(dt);
  } catch (e) {
    return dateTimeString;
  }
}
