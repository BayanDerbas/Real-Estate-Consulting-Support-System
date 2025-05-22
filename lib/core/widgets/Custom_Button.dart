import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/Fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double height;
  final double width;
  final Color? activeColor;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.borderRadius = 10,
    this.height = 50,
    required this.width,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Fonts.itim.copyWith(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
