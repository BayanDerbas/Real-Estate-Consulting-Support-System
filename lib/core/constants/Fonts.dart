import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';

class Fonts {
  static final TextStyle itim = GoogleFonts.itim(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.pureWhite,
  );

  static final TextStyle taj = GoogleFonts.tajawal(
    fontSize: 18,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle hintTextStyle = GoogleFonts.itim(
    fontSize: 20,
    color: AppColors.purple,
  );
  static final TextStyle contentTextFieldStyle = GoogleFonts.cairo(
    fontSize: 18,
  );
  static final TextStyle underlinedStyle = GoogleFonts.itim(
    decoration: TextDecoration.underline,
    color: AppColors.deepNavy,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle titleOfOnboardingStyle = GoogleFonts.itim(
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
  );
}
