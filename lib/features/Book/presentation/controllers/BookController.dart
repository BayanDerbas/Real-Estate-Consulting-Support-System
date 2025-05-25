import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var currentMonthDate = DateTime.now().obs;
  var selectedSessionIndex = (-1).obs;
  var selectedCallType = 0.obs;
  var selectedHourIndex = (-1).obs;

  void selectHour(int index) {
    selectedHourIndex.value = index;
  }

  void selectSession(int index) {
    selectedSessionIndex.value = index;
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  void selectCallType(int type) {
    selectedCallType.value = type;
  }

  void goToNextMonth() {
    currentMonthDate.value = DateTime(
      currentMonthDate.value.year,
      currentMonthDate.value.month + 1,
      1,
    );
    selectedDate.value = currentMonthDate.value;
  }

  void resetToCurrentMonth() {
    currentMonthDate.value = DateTime.now();
    selectedDate.value = DateTime.now();
  }

  List<DateTime> getCurrentMonthDays() {
    final firstDay = DateTime(currentMonthDate.value.year, currentMonthDate.value.month, 1);
    final lastDay = DateTime(currentMonthDate.value.year, currentMonthDate.value.month + 1, 0);
    return List.generate(lastDay.day, (index) => firstDay.add(Duration(days: index)));
  }


  List<DateTime> getCurrentWeek() {
    final today = selectedDate.value;
    final firstDayOfWeek = today.subtract(Duration(days: today.weekday % 7));
    return List.generate(
      7,
      (index) => firstDayOfWeek.add(Duration(days: index)),
    );
  }

  String getMonthName() {
    return DateFormat.MMMM().format(currentMonthDate.value);
  }

  bool isInCurrentMonth() {
    final now = DateTime.now();
    return now.month == currentMonthDate.value.month &&
        now.year == currentMonthDate.value.year;
  }
}
