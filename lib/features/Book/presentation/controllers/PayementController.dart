import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();
  final TextEditingController countryOrRegionController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

  var finalPrice = ''.obs;

  void initializeData({
    required String cardNumber,
    required String expiryDate,
    required String cvc,
    required String countryOrRegion,
    required String zipCode,
    required String price,
  }) {
    cardNumberController.text = cardNumber;
    expiryDateController.text = expiryDate;
    cvcController.text = cvc;
    countryOrRegionController.text = countryOrRegion;
    zipCodeController.text = zipCode;
    finalPrice.value = price;
  }

  void clearFields() {
    cardNumberController.clear();
    expiryDateController.clear();
    cvcController.clear();
    countryOrRegionController.clear();
    zipCodeController.clear();
    finalPrice.value = '';
  }

  @override
  void onClose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvcController.dispose();
    countryOrRegionController.dispose();
    zipCodeController.dispose();
    super.onClose();
  }
}