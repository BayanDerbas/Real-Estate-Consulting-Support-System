import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/styles.dart';

class OTPInput extends StatelessWidget {
  final Function(String) onCompleted;
  final int otpLength;

  OTPInput({required this.onCompleted, this.otpLength = 6});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      autoFocus: true,
      numberOfFields: otpLength,
      borderColor: Colors.grey,
      focusedBorderColor: Colors.blue,
      enabledBorderColor: AppColors.pureWhite,
      showFieldAsBox: true,
      fieldWidth: 40,
      textStyle: setTextStyle(
        GoogleFonts.itim,
        20,
        AppColors.pureWhite,
        FontWeight.normal,
      ),
      fieldHeight: 40,
      borderRadius: BorderRadius.circular(20),
      onCodeChanged: (String code) {},
      contentPadding: EdgeInsets.all(2),
      onSubmit: onCompleted,
    );
  }
}
