import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/networks/dio_factory.dart';
import '../../../service provider/data/data_source/expert_service.dart';
import '../../../service provider/data/model/expert.dart';

class BookController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var currentMonthDate = DateTime.now().obs;
  var selectedSessionIndex = (-1).obs;
  var selectedCallType = 0.obs; // 0: Video, 1: Audio
  var selectedHourIndex = (-1).obs;
  var isLoading = false.obs;
  var expert = Rxn<Expert>();

  final expertService = ExpertService(DioFactory.getDio());

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>?;
    final String expertId = args?['id']?.toString() ?? '1';
  //  fetchExpert(expertId);
  }

  // Future<void> fetchExpert(String expertId) async {
  //   try {
  //     isLoading.value = true;
  //     final response = await expertService.getExpertById(expertId);
  //     expert.value = response.data.content.firstWhere(
  //           (e) => e.id.toString() == expertId,
  //       orElse: () => throw Exception('Expert not found'),
  //     );
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to load expert: $e');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

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

  String getMonthName() {
    return DateFormat.MMMM().format(currentMonthDate.value);
  }

  bool isInCurrentMonth() {
    final now = DateTime.now();
    return now.month == currentMonthDate.value.month && now.year == currentMonthDate.value.year;
  }

  Map<String, dynamic> prepareBookingData() {
    final sessionDurations = [30, 60, 90];
    final callTypes = ['VIDEO', 'AUDIO'];
    final hours = [
      "11:00AM",
      "12:00AM",
      "1:00AM",
      "2:00AM",
      "3:00AM",
      "4:00AM",
      "5:00AM",
      "6:00AM",
    ];

    if (selectedSessionIndex.value == -1 || selectedHourIndex.value == -1 || expert.value == null) {
      throw Exception('Please select session duration and time');
    }

    final selectedTime = hours[selectedHourIndex.value];
    final selectedDateTime = DateTime(
      selectedDate.value.year,
      selectedDate.value.month,
      selectedDate.value.day,
      int.parse(selectedTime.split(':')[0]) + (selectedTime.contains('PM') ? 12 : 0),
    );

    final duration = sessionDurations[selectedSessionIndex.value];
    final callType = callTypes[selectedCallType.value];
    final pricePerMinute = callType == 'VIDEO' ? expert.value!.perMinuteVideo : expert.value!.perMinuteAudio;
    final originalPrice = pricePerMinute != null ? pricePerMinute * duration : 0.0;
    final discountAmount = 0.0; // Adjust based on your discount logic
    final finalPrice = originalPrice - discountAmount;

    return {
      'expertId': expert.value!.id,
      'callType': callType,
      'duration': duration,
      'startTime': selectedDateTime.toIso8601String(),
      'originalPrice': originalPrice,
      'discountAmount': discountAmount,
      'finalPrice': finalPrice,
    };
  }
}

// class BookController extends GetxController {
//   var selectedDate = DateTime.now().obs;
//   var currentMonthDate = DateTime.now().obs;
//   var selectedSessionIndex = (-1).obs;
//   var selectedCallType = 0.obs;
//   var selectedHourIndex = (-1).obs;
//
//   void selectHour(int index) {
//     selectedHourIndex.value = index;
//   }
//
//   void selectSession(int index) {
//     selectedSessionIndex.value = index;
//   }
//
//   void selectDate(DateTime date) {
//     selectedDate.value = date;
//   }
//
//   void selectCallType(int type) {
//     selectedCallType.value = type;
//   }
//
//   void goToNextMonth() {
//     currentMonthDate.value = DateTime(
//       currentMonthDate.value.year,
//       currentMonthDate.value.month + 1,
//       1,
//     );
//     selectedDate.value = currentMonthDate.value;
//   }
//
//   void resetToCurrentMonth() {
//     currentMonthDate.value = DateTime.now();
//     selectedDate.value = DateTime.now();
//   }
//
//   List<DateTime> getCurrentMonthDays() {
//     final firstDay = DateTime(currentMonthDate.value.year, currentMonthDate.value.month, 1);
//     final lastDay = DateTime(currentMonthDate.value.year, currentMonthDate.value.month + 1, 0);
//     return List.generate(lastDay.day, (index) => firstDay.add(Duration(days: index)));
//   }
//
//
//   List<DateTime> getCurrentWeek() {
//     final today = selectedDate.value;
//     final firstDayOfWeek = today.subtract(Duration(days: today.weekday % 7));
//     return List.generate(
//       7,
//       (index) => firstDayOfWeek.add(Duration(days: index)),
//     );
//   }
//
//   String getMonthName() {
//     return DateFormat.MMMM().format(currentMonthDate.value);
//   }
//
//   bool isInCurrentMonth() {
//     final now = DateTime.now();
//     return now.month == currentMonthDate.value.month &&
//         now.year == currentMonthDate.value.year;
//   }
// }
