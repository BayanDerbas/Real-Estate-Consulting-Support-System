import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';

import '../../../../core/constants/Fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final double width;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function()? onIconTap;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.controller,
    this.onIconTap,
    required this.width,
    this.maxLines,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.pureWhite.withOpacity(0.36),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          contentPadding: EdgeInsets.all(10),
          hintStyle: Fonts.hintTextStyle,
          suffixIcon: GestureDetector(
            onTap: onIconTap,
            child: Icon(icon, color: AppColors.pureWhite),
          ),
        ),
        style: Fonts.contentTextFieldStyle,
      ),
    ).paddingSymmetric(vertical: 7);
  }
}
