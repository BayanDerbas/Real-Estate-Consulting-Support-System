import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/Book/data/repository/reservation_repository.dart';
import 'package:graduation_project/features/myReserve/presentation/controllers/myReserveController.dart';
import 'package:graduation_project/features/timeAvailable/data/repositories/show_working_times_repository.dart';
import 'package:intl/intl.dart';
import 'package:graduation_project/features/service%20provider/data/model/expert.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../core/networks/failures.dart';
import '../../../service provider/data/model/user.dart';
import '../../../timeAvailable/data/models/working_times_model.dart';
import '../../data/model/booking_request_model.dart';
import '../../data/model/booking_response.dart';
import '../../data/repository/booking_repository.dart';

class BookController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var currentMonthDate = DateTime.now().obs;
  var selectedSessionIndex = (-1).obs;
  var selectedCallType = 1.obs;
  var selectedHourIndex = (-1).obs;
  var isLoading = false.obs;
  var couponCode = ''.obs;
  var clientSecret = ''.obs;
  var expert = Rxn<Expert>();
  var discountRate = ''.obs;
  final availableTimes = <AvailableTime>[].obs;
  final isLoadingTimes = false.obs;
  final isBookedList = <bool>[].obs;
  final reservedTimes = <DateTime>[].obs;
  final BookingRepository _bookingRepository;
  final ShowWorkingTimesRepository _showWorkingTimesRepository;
  RxList<String> generatedHours = <String>[].obs;


  BookController(
      this._bookingRepository,
      this._showWorkingTimesRepository,
      );

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>?;
    final String expertId = args?['id']?.toString() ?? '1';
    final dynamic expertData = args?['expert'];
    if (expertData != null) {
      try {
        expert.value = Expert(
          id: int.tryParse(expertId),
          user: User(
            id: int.tryParse(expertId),
            firstName: expertData['name']?.split(' ')[0] ?? '',
            lastName: expertData['name']?.split(' ').length > 1
                ? expertData['name'].split(' ')[1]
                : '',
            email: '',
            phone: '',
            enabled: true,
            role: expertData['role'] ?? 'EXPERT',
            status: 'AVAILABLE',
            imageUrl: expertData['idCardImage'] ?? AppImages.noImage,
          ),
          profession: expertData['jobTitle'] ?? 'غير معروف',
          experience: expertData['experienceYears']?.toString() ?? '0',
          rating: double.tryParse(expertData['rating']?.toString() ?? '0') ?? 0.0,
          rateCount: double.tryParse(expertData['rateCount']?.toString() ?? '0') ?? 0.0,
          bio: expertData['textProvider'] ?? 'لا يوجد وصف',
          idCardImage: expertData['idCardImage'] ?? AppImages.noImage,
          degreeCertificateImage: expertData['idCardImage'] ?? AppImages.noImage,
          perMinuteVideo: double.tryParse(
            expertData['price']?.replaceAll(' S.P', '') ?? '0',
          ) ?? 0.0,
          perMinuteAudio: (double.tryParse(
            expertData['price']?.replaceAll(' S.P', '') ?? '0',
          ) ?? 0.0) / 2,
        );
        fetchAvailableTimes();
      } catch (e) {
        print("خطأ في تحويل بيانات الخبير: $e");
      }
    }
  }
  void selectHour(int index) => selectedHourIndex.value = index;
  void selectSession(int index) {
    selectedSessionIndex.value = index;
    final hours = generateAppointmentHours();
    isBookedList.value = getBookedStatusForHours(hours);
  }
  void selectDate(DateTime date) {
    selectedDate.value = date;
    final hours = generateAppointmentHours();
    isBookedList.value = getBookedStatusForHours(hours);
  }
  void selectCallType(int type) => selectedCallType.value = type;
  void setCouponCode(String code) => couponCode.value = code;
  void updateIsBookedList() {
    final hours = generateAppointmentHours();
    isBookedList.value = getBookedStatusForHours(hours);
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
    final firstDay = DateTime(
      currentMonthDate.value.year,
      currentMonthDate.value.month,
      1,
    );
    final lastDay = DateTime(
      currentMonthDate.value.year,
      currentMonthDate.value.month + 1,
      0,
    );
    return List.generate(
      lastDay.day,
          (index) => firstDay.add(Duration(days: index)),
    );
  }
  String getMonthName() => DateFormat.MMMM().format(currentMonthDate.value);
  bool isInCurrentMonth() {
    final now = DateTime.now();
    return now.month == currentMonthDate.value.month &&
        now.year == currentMonthDate.value.year;
  }
  List<String> generateAppointmentHours() {
    List<String> slots = [];

    if (availableTimes.isEmpty || selectedSessionIndex.value == -1) {
      slots = ["09:00", "10:00", "11:00", "12:00", "01:00", "02:00", "03:00"];
    } else {
      final duration = [30, 60, 90][selectedSessionIndex.value];
      final dateStr = selectedDate.value.toIso8601String().split('T')[0];

      for (final slot in availableTimes) {
        try {
          DateTime start = DateTime.parse('$dateStr' + 'T' + slot.startTime!);
          DateTime end = DateTime.parse('$dateStr' + 'T' + slot.endTime!);

          while (start.add(Duration(minutes: duration)).isBefore(end) ||
              start.add(Duration(minutes: duration)).isAtSameMomentAs(end)) {
            slots.add(DateFormat.jm().format(start));
            start = start.add(Duration(minutes: 30));
          }
        } catch (_) {
          continue;
        }
      }

      if (slots.isEmpty) {
        slots = ["09:00", "10:00", "11:00", "12:00", "01:00", "02:00", "03:00"];
      }
    }

    generatedHours.value = slots;
    return slots;
  }
  List<bool> getBookedStatusForHours(List<String> hours) {
    return List<bool>.generate(hours.length, (i) {
      try {
        final time = DateFormat.jm().parse(hours[i]);
        final fullTime = DateTime(
          selectedDate.value.year,
          selectedDate.value.month,
          selectedDate.value.day,
          time.hour,
          time.minute,
        );
        final matched = reservedTimes.any((r) =>
        r.year   == fullTime.year &&
            r.month  == fullTime.month &&
            r.day    == fullTime.day &&
            r.hour   == fullTime.hour &&
            r.minute == fullTime.minute
        );
        return matched;
      } catch (_) {
        return true;
      }
    });
  }
  Future<Either<Failures, BookingResponse>> bookAppointment() async {
    isLoading.value = true;
    final sessionDurations = [30, 60, 90];
    final callTypes = ['AUDIO', 'VIDEO'];
    final hours = generateAppointmentHours();
    try {
      if (selectedSessionIndex.value == -1 ||
          selectedHourIndex.value == -1 ||
          expert.value == null) {
        isLoading.value = false;
        return Left(serverFailure('يرجى تحديد مدة الجلسة والوقت'));
      }

      final String? userId = await SecureStorage().getIdByRole();
      if (userId == null) {
        isLoading.value = false;
        return Left(serverFailure('لم يتم العثور على معرف المستخدم'));
      }
      final int clientId = int.parse(userId);

      final selectedTime = hours[selectedHourIndex.value];
      final time = DateFormat.jm().parse(selectedTime);
      final selectedDateTime = DateTime(
        selectedDate.value.year,
        selectedDate.value.month,
        selectedDate.value.day,
        time.hour,
        time.minute,
      );

      final formattedStartDate = DateFormat("yyyy-MM-dd'T'HH:mm").format(selectedDateTime);

      final request = BookingRequest(
        expertId: expert.value!.id!,
        clientId: clientId,
        callType: callTypes[selectedCallType.value - 1],
        duration: sessionDurations[selectedSessionIndex.value],
        startDate: formattedStartDate,
        couponCode: couponCode.value.isEmpty ? null : couponCode.value,
        clientSecret: clientSecret.value,
      );

      print("Booking Request: ${request.toJson()}");

      final result = await _bookingRepository.createBooking(request);
      isLoading.value = false;

      return result.fold(
            (failure) {
          if (failure.err_message.contains('time slot')) {
            Get.snackbar('الوقت غير متاح', 'تم حجز هذا الوقت من قبل. يرجى اختيار وقت آخر.');
            fetchAvailableTimes();
          } else {
            Get.snackbar('خطأ', failure.err_message);
          }
          return Left(failure);
        },
            (response) {
          Get.find<myReserveController>().fetchReservations('PENDING'); // Fixed casing
          Get.snackbar('نجاح', 'تم الحجز بنجاح!');
          Get.toNamed('/confirm', arguments: {'booking': response.data}); // Pass BookingData
          return Right(response);
        },
      );
    } catch (e, stackTrace) {
      isLoading.value = false;
      print('Booking error: $e\nStackTrace: $stackTrace');
      return Left(serverFailure('خطأ غير متوقع: $e'));
    }
  }

  Future<void> fetchAvailableTimes() async {
    isLoadingTimes.value = true;
    final expertId = expert.value?.id;
    if (expertId == null) return;

    final result = await _showWorkingTimesRepository.getAvailableTimes(expertId);
    result.fold(
          (failure) {
        print('فشل في جلب أوقات العمل: ${failure.err_message}');
      },
          (response) {
        availableTimes.assignAll(response.data ?? []);
        generateAppointmentHours();
        updateIsBookedList();
      },
    );
    isLoadingTimes.value = false;
  }
}