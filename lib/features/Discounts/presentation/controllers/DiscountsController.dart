import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/networks/dio_factory.dart';
import 'package:graduation_project/features/Discounts/data/repositories/all_coupons_repository.dart';
import 'package:graduation_project/features/Discounts/data/repositories/coupons_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/get_all_coupons/get_all_coupons_data.dart';

class DiscountsController extends GetxController with GetSingleTickerProviderStateMixin {
  final CouponsRepository respository;
  final AllCouponsRepository _repository;
  DiscountsController(this.respository,this._repository);


  late TabController tabController;
  RxList<Map<String, dynamic>> discounts = <Map<String, dynamic>>[].obs;
  RxList<GetAllCouponsData> allCoupons = <GetAllCouponsData>[].obs;

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
    get_all_coupons();
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

  Future<void> addDiscount() async {
    final bool isCodeDiscount = tabController.index == 0;

    if (isCodeDiscount && (codeController.text.trim().isEmpty)) {
      Get.snackbar("Error", "Coupon code cannot be blank");
      return;
    }

    final body = {
      "code": codeController.text.trim().replaceAll(' ', '_'),
      "discountType": isCodeDiscount ? 'FIXED_AMOUNT' : 'PERCENTAGE',
      "description": isCodeDiscount
          ? descriptionController.text.trim()
          : descriptionSessionsController.text.trim(),
      if (isCodeDiscount)
        "amountValue": double.tryParse(amountController.text) ?? 0.0
      else
        "percentageValue": double.tryParse(discountPercentageController.text) ?? 0.0,
      "expirationDate": expiryDateController.text.isNotEmpty
          ? expiryDateController.text.trim()
          : null,
      "maxUses": validityController.text.isNotEmpty
          ? int.tryParse(validityController.text)
          : null,
      "isActive": true,
    };

    try {
      final result = await respository.create_coupons(body);
      result.fold(
            (failure) {
          Get.snackbar("Failed", failure.err_message);
        },
            (response) {
          discounts.add(body);
          saveDiscounts();
          clearFields();
          Get.snackbar("Success", "Created Coupon Successful");
        },
      );
    } catch (e) {
      print("Oop!! Unexpected Error: $e");
    }
  }

  Future<void> get_all_coupons() async {
    try {
      DioFactory.loadToken();
      final result = await _repository.get_all_coupons();
      result.fold(
              (failure){
                print("Error allCoupons :${failure.err_message}");
              },
              (resposne){
                allCoupons.value = resposne ?? [];
              },
      );
    } catch (e) {
    }
  }

  void clearFields() {
    codeController.clear();
    amountController.clear();
    validityController.clear();
    discountPercentageController.clear();
    expiryDateController.clear();
    descriptionController.clear();
    descriptionSessionsController.clear();
  }

  void deleteDiscount(int index) {
    if (index >= 0 && index < discounts.length) {
      discounts.removeAt(index);
    }
  }
}