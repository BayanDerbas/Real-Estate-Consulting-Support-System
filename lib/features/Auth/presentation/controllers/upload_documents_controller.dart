import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UploadDocumentsController extends GetxController {
  final TextEditingController type = TextEditingController();
  final TextEditingController attachDocuments = TextEditingController();
  final List<String> types = ['expert'];
  RxString selectType = 'expert'.obs;
  onChangeType(value) {
    selectType(value);
  }
}
