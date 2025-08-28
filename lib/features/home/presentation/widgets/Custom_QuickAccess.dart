import 'package:flutter/material.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/fonts.dart';

class CustomQuickAccessCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  const CustomQuickAccessCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(imagePath),
                ),
              ),
              SizedBox(height: 10),
              // The title remains flexible
              Flexible(
                flex: 1,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
                    style: Fonts.itim.copyWith(
                      color: AppColors.deepNavy,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ).padding(EdgeInsets.all(8));
  }
}
