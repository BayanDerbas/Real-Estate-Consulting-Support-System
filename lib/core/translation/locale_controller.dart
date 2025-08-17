import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/secure_storage.dart';

class LanguageController extends GetxController {
  final SecureStorage _storage = SecureStorage();

  var currentLocale = const Locale('en').obs;

  @override
  void onInit() {
    super.onInit();
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    String? langCode = await _storage.getLangKey();
    if (langCode != null) {
      currentLocale.value = Locale(langCode);
      Get.updateLocale(currentLocale.value);
    }
  }

  Future<void> changeLanguage(String langCode) async {
    currentLocale.value = Locale(langCode);
    Get.updateLocale(currentLocale.value);
    await _storage.saveLangCode(langCode);
  }
}
