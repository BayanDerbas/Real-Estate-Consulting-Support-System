import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiscountsController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxList<Map<String, dynamic>> discounts = <Map<String, dynamic>>[].obs;

  final TextEditingController codeController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController validityController = TextEditingController();
  final TextEditingController sessionsBeforeDiscountController = TextEditingController();
  final TextEditingController discountPercentageController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController descriptionSessionsController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    loadDiscounts();
  }

  @override
  void onClose() {
    codeController.dispose();
    amountController.dispose();
    validityController.dispose();
    sessionsBeforeDiscountController.dispose();
    discountPercentageController.dispose();
    expiryDateController.dispose();
    descriptionController.dispose();
    descriptionSessionsController.dispose();
    tabController.dispose();
    super.onClose();
  }

  Future<void> loadDiscounts() async {
    final prefs = await SharedPreferences.getInstance();
    final String? discountsString = prefs.getString('discounts');

    if (discountsString != null) {
      final List<dynamic> decodedList = jsonDecode(discountsString);
      discounts.value = decodedList.cast<Map<String, dynamic>>();
    }
  }

  Future<void> saveDiscounts() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(discounts);
    await prefs.setString('discounts', encodedData);
  }

  void addDiscount() {
    final discountData = {
      'code': codeController.text.isNotEmpty ? codeController.text : "",
      'amount': amountController.text.isNotEmpty ? amountController.text : "",
      'validity': validityController.text.isNotEmpty ? validityController.text : "",
      'sessionsBeforeDiscount': sessionsBeforeDiscountController.text.isNotEmpty ? sessionsBeforeDiscountController.text : "",
      'discountPercentage': discountPercentageController.text.isNotEmpty ? discountPercentageController.text : "",
      'expiryDate': expiryDateController.text.isNotEmpty ? expiryDateController.text : "",
      'description': tabController.index == 0 ? descriptionController.text : descriptionSessionsController.text,
      'isCodeDiscount': tabController.index == 0,
    };

    discounts.add(discountData);
    saveDiscounts();
    clearFields();
  }

  void clearFields() {
    codeController.clear();
    amountController.clear();
    validityController.clear();
    sessionsBeforeDiscountController.clear();
    discountPercentageController.clear();
    expiryDateController.clear();
    descriptionController.clear();
    descriptionSessionsController.clear();
  }

  void deleteDiscount(int index) {
    if (index >= 0 && index < discounts.length) {
      discounts.removeAt(index);
      saveDiscounts();
    }
  }
}
