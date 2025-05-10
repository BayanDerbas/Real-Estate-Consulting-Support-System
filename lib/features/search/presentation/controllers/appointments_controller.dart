import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/search/presentation/pages/appointments.dart';

import '../pages/current_appointments.dart';

class AppointmentController extends GetxController {
  var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }

  final List<String> titles = ['القادم', 'تم الإلغاء', 'تم الإنتهاء'];
  final List<Widget> screens = const [
    CurrentAppointments(),
    Center(child: Text('Profile Screen')),
    Center(child: Text('Settings Screen')),
  ];
}
