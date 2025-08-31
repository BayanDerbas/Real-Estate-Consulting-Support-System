import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/fonts.dart';
import '../../data/model/report/report_category_model.dart';

class ReportCategoryTile extends StatelessWidget {
  final ReportCategory category;
  final VoidCallback? onTap;

  const ReportCategoryTile({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          category.title,
          style: Fonts.itim.copyWith(
            color: AppColors.deepNavy,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: onTap,
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
