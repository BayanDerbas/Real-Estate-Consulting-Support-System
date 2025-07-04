import 'package:get/get.dart';

class PageTicketController extends GetxController {
  RxInt currentpPage = 0.obs;
  void changePageIndex(int index) {
    currentpPage(index);
  }
}
