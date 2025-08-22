import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class StripeService {
  static const String _publishableKey =
      "pk_test_51Rb6T5Cd1fx7W6vZ75rOmKRyiJ4Mo1ISNmRVr6wqiC1fhHVs2rxmqwFETGsctrEUDc2PyYoRjuVKJG53DjD3lZai00xiQH3pZQ";

  static Future<void> initStripe() async {
    Stripe.publishableKey = _publishableKey;
    await Stripe.instance.applySettings();
    print("**************************************");
    print("Stripe initalized with publishable Key");
  }

  static Future<bool> presentPayementSheet(String clientSecret) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "My App",
          style: ThemeMode.dark,
          appearance: PaymentSheetAppearance(
            colors: const PaymentSheetAppearanceColors(
              primary: AppColors.deepNavy,
              background: AppColors.softWhite,
              componentBackground: AppColors.deepNavy,
              componentBorder: AppColors.aquaBlue,
              componentDivider: AppColors.pureWhite,
              primaryText: AppColors.softWhite,
              secondaryText: AppColors.grey,
              placeholderText: AppColors.customGray,
              icon: AppColors.deepNavy,
              error: AppColors.red,
            ),
            shapes: PaymentSheetShape(
              borderRadius: 16,
              shadow: PaymentSheetShadowParams(color: AppColors.grey2),
            ),
            primaryButton: PaymentSheetPrimaryButtonAppearance(
              colors: PaymentSheetPrimaryButtonTheme(
                light: PaymentSheetPrimaryButtonThemeColors(
                  background: AppColors.deepNavy,
                  text: AppColors.softWhite,
                  border: AppColors.pureWhite, // بوردر واضح ومختلف عن الخلفية
                ),
                dark: PaymentSheetPrimaryButtonThemeColors(
                  background: AppColors.deepNavy,
                  text: AppColors.softWhite,
                  border: AppColors.pureWhite, // نفس الشيء للثيم الداكن
                ),
              ),
            ),
          ),
        ),
      );
      await Stripe.instance.presentPaymentSheet();
      Get.snackbar("Success", "Payment Completed Successfully");
      return true;
    } on StripeException catch (e) {
      print("Stripe Error : ${e.error.localizedMessage}");
      Get.snackbar("Stripe Error", e.error.localizedMessage ?? "Unknown error");
      return false;
    } catch (e) {
      print("Stripe Error : ${e}");
      Get.snackbar("Error", "Payment failed: $e");
      return false;
    }
  }
}
