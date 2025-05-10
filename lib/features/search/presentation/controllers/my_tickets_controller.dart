import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../pages/my_tickets.dart';

class MyTicketsController extends GetxController {
  var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }

  final List<String> titles = ['المنتهية', 'قيد النشر', 'الجديدة'];
  final List<Widget> screens = [
    MyTickets(),
    Center(child: Text('Profile Screen')),
    Center(child: Text('Settings Screen')),
  ];
}
