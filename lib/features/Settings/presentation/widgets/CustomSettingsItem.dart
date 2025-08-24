import 'package:flutter/material.dart';

import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';

class CustomSettingsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isArabic;

  const CustomSettingsItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteCard,
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.purple),
        title: Text(
          title,
          style: isArabic
              ? Fonts.taj.copyWith(color: AppColors.deepNavy, fontWeight: FontWeight.bold)
              : Fonts.itim.copyWith(color: AppColors.deepNavy, fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.grey, size: 18),
        onTap: onTap,
      ),
    );
  }
}
