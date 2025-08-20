import 'package:flutter/material.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';

class CustomFaqs extends StatelessWidget {
  final String question;
  final String answer;
  final String? category;

  const CustomFaqs({
    super.key,
    required this.question,
    required this.answer,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          collapsedIconColor: AppColors.grey,
          iconColor: AppColors.deepNavy,
          childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (category != null && category!.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  margin: const EdgeInsets.only(bottom: 6),
                  decoration: BoxDecoration(
                    color: AppColors.deepNavy.withOpacity(.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    category!,
                    style: Fonts.itim.copyWith(fontSize: 12, color: AppColors.deepNavy),
                  ),
                ),
              Text(
                question,
                style: Fonts.itim.copyWith(fontSize: 18, color: AppColors.black, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                answer,
                textAlign: TextAlign.start,
                style: Fonts.itim.copyWith(fontSize: 16, color: AppColors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
