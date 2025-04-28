import 'package:flutter/material.dart';
import '../constants/Fonts.dart';
import '../constants/colors.dart';

class CustomIconButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final String? pathImage;

  const CustomIconButton({
    super.key,
    this.icon,
    required this.label,
    required this.isSelected,
    this.onTap,
    this.pathImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:15.0,left: 15,right: 15,bottom: 10),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.deepNavy : AppColors.pureWhite,
                border: Border.all(color: AppColors.deepNavy),
                borderRadius: BorderRadius.circular(20),
              ),
              child:
                  pathImage != null
                      ? Image.asset(pathImage!, fit: BoxFit.contain)
                      : icon != null
                      ? Icon(
                        icon,
                        color: isSelected ? AppColors.pureWhite : AppColors.deepNavy,
                        size: 30,
                      )
                      : null,
            ),
          ),
          Text(label, style: Fonts.itim.copyWith(color: AppColors.deepNavy)),
        ],
      ),
    );
  }
}
