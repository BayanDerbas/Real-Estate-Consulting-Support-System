import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPInput extends StatelessWidget {
  final Function(String) onCompleted;
  final int otpLength;

  OTPInput({required this.onCompleted, this.otpLength = 6});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: otpLength,
      borderColor: Colors.grey,
      focusedBorderColor: Colors.blue,
      enabledBorderColor: Colors.black,
      showFieldAsBox: true,
      onCodeChanged: (String code) {
        // Handle changes
      },
      onSubmit: onCompleted, // Handle completed OTP input
    );
  }
}
