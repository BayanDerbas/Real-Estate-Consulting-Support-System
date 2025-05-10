import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/styles.dart';

class CustomCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final void Function(bool?)? onChanged;

  const CustomCheckbox({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged),
        Text(
          label,
          style: setTextStyle(
            GoogleFonts.itim,
            18,
            AppColors.black,
            FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
