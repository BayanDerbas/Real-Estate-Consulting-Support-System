import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:graduation_project/core/constants/colors.dart';
import '../../../../core/constants/Fonts.dart';

class DottedTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final bool isPassword;
  final double width;
  final double? height;
  final TextEditingController? controller;
  final void Function()? onIconTap;

  const DottedTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.isPassword = false,
    this.controller,
    this.onIconTap,
    required this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(10),
        dashPattern: [6, 3],
        color: AppColors.purple,
        strokeWidth: 1.5,
        child: Container(
          color: AppColors.whiteCard.withOpacity(0.1),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: Fonts.hintTextStyle,
              suffixIcon: GestureDetector(
                onTap: onIconTap,
                child: Icon(icon, color: AppColors.pureWhite),
              ),
            ),
            style: Fonts.contentTextFieldStyle,
          ),
        ),
      ),
    );
  }
}
