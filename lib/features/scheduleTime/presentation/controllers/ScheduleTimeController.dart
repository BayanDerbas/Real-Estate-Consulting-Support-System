import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/networks/dio_factory.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import '../../data/models/time_schedule_request.dart';
import '../../data/repositories/time_schedule_repository.dart';
import '../widgets/Custom_ScheduleTime.dart';

class ScheduleTimeController extends GetxController {
  final ScheduleTimeRepository repository;
  ScheduleTimeController(this.repository);

  var selectedDays = <String>[].obs;

  final timeSlots = <String, RxList<ScheduleTimeSlot>>{}.obs;

  void selectDay(String day) {
    if (selectedDays.contains(day)) {
      removeDay(day);
    } else {
      selectedDays.add(day);
      timeSlots.putIfAbsent(day, () => <ScheduleTimeSlot>[].obs);
      addSlot(day);
    }
  }

  void addSlot(String day) {
    timeSlots.putIfAbsent(day, () => <ScheduleTimeSlot>[].obs);
    timeSlots[day]!.add(
      ScheduleTimeSlot(
        startController: TextEditingController(),
        endController: TextEditingController(),
      ),
    );
  }

  void removeSlot(String day, int index) {
    if (timeSlots[day] != null && index < timeSlots[day]!.length) {
      timeSlots[day]!.removeAt(index);
      if (timeSlots[day]!.isEmpty) {
        removeDay(day);
      }
    }
  }

  void removeDay(String day) {
    selectedDays.remove(day);
    timeSlots.remove(day);
  }

  void changeCallType(String day, int index, String type) {
    if (timeSlots[day] != null && index < timeSlots[day]!.length) {
      timeSlots[day]![index].callType = type;
      timeSlots[day]!.refresh();
    }
  }

  static const Map<String, String> dayMapping = {
    "Mon": "MONDAY",
    "Tue": "TUESDAY",
    "Wed": "WEDNESDAY",
    "Thu": "THURSDAY",
    "Fri": "FRIDAY",
    "Sat": "SATURDAY",
    "Sun": "SUNDAY",
  };

  List<ScheduleTimeRequest> getScheduleData() {
    List<ScheduleTimeRequest> data = [];
    for (var day in selectedDays) {
      final slots = timeSlots[day] ?? <ScheduleTimeSlot>[].obs;
      for (var slot in slots) {
        data.add(
          ScheduleTimeRequest(
            null,
            dayMapping[day] ?? day,
            slot.startController.text,
            slot.endController.text,
            slot.callType,
          ),
        );
      }
    }
    return data;
  }

  Future<void> createSchedule() async {
    for (var day in selectedDays) {
      for (var slot in timeSlots[day] ?? <ScheduleTimeSlot>[].obs) {
        if (slot.startController.text.isEmpty ||
            slot.endController.text.isEmpty) {
          Get.snackbar("خطأ", "يرجى ملء جميع حقول البداية والنهاية");
          return;
        }
      }
    }

    if (selectedDays.isEmpty) {
      Get.snackbar("خطأ", "يرجى اختيار يوم واحد على الأقل");
      return;
    }

    await DioFactory.loadToken();
    final expertId = await SecureStorage().getIdByRole();

    if (expertId == null || expertId.isEmpty) {
      print("❌ No expert ID found in storage");
      return;
    }

    final body = getScheduleData();

    final result = await repository.create_schedule(
      expertId: int.parse(expertId),
      body: body,
    );

    result.fold(
          (failure) {
        print("Error Schedule : ${failure.err_message}");
        Get.snackbar("خطأ", "فشل في إضافة الجدول الزمني: ${failure.err_message}");
      },
          (response) {
        Get.snackbar("Success", "Time Schedule Added Successfully");
        for (var item in response) {
          print(
              "${item.dayOfWeek}: ${item.startTime} - ${item.endTime} (${item.callType})");
        }
      },
    );
  }
}