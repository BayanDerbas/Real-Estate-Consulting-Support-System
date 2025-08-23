import 'package:get/get.dart';

String? validateInput(String val, int min, int max, String type) {
  if (val.length < min) return 'Cannot be less than $min characters';
  if (val.length > max) return 'Cannot be more than $max characters';

  switch (type) {
    case 'email':
      if (!GetUtils.isEmail(val)) {
        return 'Not a valid email';
      }
      break;
    case 'phone number':
      if (!GetUtils.isPhoneNumber(val)) {
        return 'Not a valid phone number';
      }
      break;
    case 'password':
      // final hasLetters = RegExp(r'[A-Za-z]').hasMatch(val);
      final hasNumbers = RegExp(r'[0-9]').hasMatch(val);
      if (!hasNumbers) {
        return 'Password must contain letters and numbers';
      }
      break;
  }

  return null;
}
