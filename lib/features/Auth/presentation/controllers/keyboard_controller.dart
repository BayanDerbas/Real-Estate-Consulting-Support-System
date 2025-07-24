import 'dart:async';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

class KeyboardController extends GetxController {
  late StreamSubscription<bool> stream;
  RxBool isOpen = false.obs;

  @override
  void onInit() {
    stream = KeyboardVisibilityController().onChange.listen((event) {
      if (isOpen.isFalse) {
        isOpen(event);
      } else {
        Timer(const Duration(milliseconds: 100), () => isOpen(event));
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    stream.cancel();
    super.dispose();
  }
}
