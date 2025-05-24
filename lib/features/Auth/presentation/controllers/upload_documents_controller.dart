import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UploadDocumentsController extends GetxController {
  final TextEditingController type = TextEditingController();
  final TextEditingController attachDocuments = TextEditingController();
  final List<String> types = ['expert'];
  RxString selectType = 'expert'.obs;
  onChangeType(value) {
    selectType(value);
  }
}
