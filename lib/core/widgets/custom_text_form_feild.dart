import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;

  final VoidCallback? onTap;
  final IconData? icon;
  final VoidCallback? onIconPressed;
  final double? width;
  final bool readOnly;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.keyboardType,

    this.onTap,
    this.icon,
    this.onIconPressed,
    this.width,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextField(
        keyboardType: keyboardType,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          suffixIcon:
              icon != null
                  ? IconButton(icon: Icon(icon), onPressed: onIconPressed)
                  : null,
        ),
      ),
    ).paddingSymmetric(vertical: 10);
  }
}
