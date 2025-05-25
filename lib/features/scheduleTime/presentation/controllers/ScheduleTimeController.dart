import 'package:get/get.dart';

class ScheduleTimeController extends GetxController {
  var selectedDays = <String>[].obs;

  void selectDay(String day) {
    if (selectedDays.contains(day)) {
      selectedDays.remove(day);
    } else {
      selectedDays.add(day);
    }
  }

  void removeDay(String day) {
    selectedDays.remove(day);
  }
}
