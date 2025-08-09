import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

class StripeService {
  static const String _publishableKey =
      "pk_test_51Rb6T5Cd1fx7W6vZ75rOmKRyiJ4Mo1ISNmRVr6wqiC1fhHVs2rxmqwFETGsctrEUDc2PyYoRjuVKJG53DjD3lZai00xiQH3pZQ";

  static Future<void> initStripe() async {
    Stripe.publishableKey = _publishableKey;
    await Stripe.instance.applySettings();
    print("**************************************");
    print("Stripe initalized with publishable Key");
  }

  static Future<void> presentPayementSheet (String clientSecret) async {
    try{
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: clientSecret,
            merchantDisplayName: "My App",
          )
      );
      await Stripe.instance.presentPaymentSheet();
      Get.snackbar("Success", "Payment Completed Successfully");
    } on StripeException catch (e) {
      print("Stripe Error : ${e.error.localizedMessage}");
      Get.snackbar("Stripe Error", e.error.localizedMessage ?? "Unknown error");
    } catch (e) {
      print("Stripe Error : ${e}");
      Get.snackbar("Error", "Payment failed: $e");
    }
  }
}
