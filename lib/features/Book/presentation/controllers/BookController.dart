import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/myReserve/presentation/controllers/myReserveController.dart';
import 'package:graduation_project/features/service%20provider/data/model/expert.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../core/networks/failures.dart';
import '../../../service provider/data/model/user.dart';
import '../../data/model/booking_request_model.dart';
import '../../data/model/booking_response.dart';
import '../../data/model/get_working_times/working_times_data.dart';
import '../../data/repository/booking_repository.dart';
import '../../data/repository/reservation_repository.dart';

class BookController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedSessionIndex = 1.obs; // default 30 minutes
  var selectedCallType = 1.obs;
  var selectedHourIndex = (-1).obs;
  var isLoading = false.obs;
  var couponCode = ''.obs;
  var clientSecret = ''.obs;
  var expert = Rxn<Expert>();
  final availableTimes = <WorkingTimesData>[].obs;
  final isBookedList = <bool>[].obs;
  final reservedTimes = <DateTime>[].obs;
  final BookingRepository _bookingRepository;
  final ReservationRepository repository;
  RxList<String> generatedHours = <String>[].obs;
  final int expertId;
  final Map<String, dynamic>? expertData;
  var currentMonthDate = DateTime.now().obs;
  final isLoadingTimes = false.obs;

  BookController({
    required this.expertId,
    this.expertData,
    required this.repository,
    required BookingRepository bookingRepository,
  }) : _bookingRepository = bookingRepository;

  @override
  void onInit() {
    super.onInit();

    print("BookController onInit: expertId = $expertId");

    if (expertData != null) {
      expert.value = Expert(
        id: expertId,
        user: User(
          id: expertId,
          firstName: expertData!['name']?.split(' ')[0] ?? '',
          lastName: expertData!['name']?.split(' ').length > 1
              ? expertData!['name'].split(' ')[1]
              : '',
          email: '',
          phone: '',
          enabled: true,
          role: expertData!['role'] ?? 'EXPERT',
          status: 'AVAILABLE',
          imageUrl: expertData!['idCardImage'] ?? AppImages.noImage,
        ),
        profession: expertData!['jobTitle'] ?? 'غير معروف',
        experience: expertData!['experienceYears']?.toString() ?? '0',
        rating: double.tryParse(expertData!['rating']?.toString() ?? '0') ?? 0.0,
        rateCount: double.tryParse(expertData!['rateCount']?.toString() ?? '0') ?? 0.0,
        bio: expertData!['textProvider'] ?? 'لا يوجد وصف',
        idCardImage: expertData!['idCardImage'] ?? AppImages.noImage,
        degreeCertificateImage: expertData!['degreeCertificateImage'] ?? AppImages.noImage,
      );
      print("Expert set: ${expert.value}");
    }

    fetchWorkingTimes();

    ever(selectedSessionIndex, (_) => _updateHours());
    ever(selectedDate, (_) => _updateHours());
  }
  void _updateHours() {
    final hours = generateAppointmentHours();
    isBookedList.value = getBookedStatusForHours(hours);
    print("الساعات المتاحة بعد التحديث: $hours");
    print("حالة الحجز لكل ساعة: $isBookedList");
  }
  void selectHour(int index) => selectedHourIndex.value = index;
  void selectSession(int index) => selectedSessionIndex.value = index;
  void selectDate(DateTime date) => selectedDate.value = date;
  void selectCallType(int type) => selectedCallType.value = type;
  void setCouponCode(String code) => couponCode.value = code;
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
  String getMonthName() => DateFormat.MMMM().format(currentMonthDate.value);
  bool isInCurrentMonth() {
    final now = DateTime.now();
    return now.month == currentMonthDate.value.month && now.year == currentMonthDate.value.year;
  }
  List<String> generateAppointmentHours() {
    final slots = <String>{};
    if (availableTimes.isEmpty) {
      print("لا توجد أوقات عمل متاحة حالياً.");
      return [];
    }
    int duration = selectedSessionIndex.value == -1 ? 30 : [15, 30][selectedSessionIndex.value];
    final dateStr = selectedDate.value.toIso8601String().split('T')[0];

    for (final slot in availableTimes) {
      try {
        String formatTime(String t) => t.length == 4 ? "0$t" : t;

        DateTime start = DateTime.parse('$dateStr' + 'T' + formatTime(slot.startTime!));
        DateTime end = DateTime.parse('$dateStr' + 'T' + formatTime(slot.endTime!));

        while (start.add(Duration(minutes: duration)).isBefore(end) ||
            start.add(Duration(minutes: duration)).isAtSameMomentAs(end)) {
          slots.add(DateFormat.jm().format(start));
          start = start.add(Duration(minutes: duration));
        }
      } catch (e) {
        print("خطأ أثناء توليد الساعات من slot: $e");
      }
    }

    final sortedSlots = slots.toList()
      ..sort((a, b) => DateFormat.jm().parse(a).compareTo(DateFormat.jm().parse(b)));

    generatedHours.value = sortedSlots;
    print("الساعات المولدة بعد إزالة التكرار: $sortedSlots");
    return sortedSlots;
  }
  List<bool> getBookedStatusForHours(List<String> hours) {
    return List.generate(hours.length, (i) {
      try {
        final time = DateFormat.jm().parse(hours[i]);
        final fullTime = DateTime(selectedDate.value.year, selectedDate.value.month,
            selectedDate.value.day, time.hour, time.minute);
        return reservedTimes.any((r) =>
        r.year == fullTime.year &&
            r.month == fullTime.month &&
            r.day == fullTime.day &&
            r.hour == fullTime.hour &&
            r.minute == fullTime.minute);
      } catch (_) {
        return true;
      }
    });
  }
  Future<void> fetchWorkingTimes() async {
    isLoadingTimes.value = true;
    if (expertId == 0) {
      print("لا يوجد معرف خبير لجلب أوقات العمل.");
      isLoadingTimes.value = false;
      return;
    }

    print("جاري جلب أوقات العمل للخبير: $expertId");

    final result = await repository.getWorkingTimes(expertId);

    result.fold(
          (failure) {
        print('فشل في جلب أوقات العمل: ${failure.err_message}');
        isLoadingTimes.value = false;
      },
          (workingTimes) {
        availableTimes.assignAll(workingTimes);
        print("عدد أوقات العمل المسترجعة: ${workingTimes.length}");
        _updateHours();
      },
    );

    isLoadingTimes.value = false;
  }
  Future<Either<Failures, BookingResponse>> bookAppointment() async {
    isLoading.value = true;
    final sessionDurations = [15, 30];
    final callTypes = ['AUDIO', 'VIDEO'];

    try {
      if (selectedSessionIndex.value == -1 ||
          selectedHourIndex.value == -1 ||
          expert.value?.id == null) {
        isLoading.value = false;
        print("خطأ: لم يتم تحديد مدة الجلسة أو الساعة أو الخبير");
        return Left(serverFailure('يرجى تحديد مدة الجلسة والوقت'));
      }

      final storage = SecureStorage();

      final String? userId = await storage.getUserId();
      final String? userName = await storage.getUserName();
      final String? userType = await storage.getUserType();
      final String? email = await storage.getEmail();
      final String? profileImage = await storage.getProfileImage();

      if (userId == null) {
        isLoading.value = false;
        print("خطأ: لم يتم العثور على معرف المستخدم");
        return Left(serverFailure('لم يتم العثور على معرف المستخدم'));
      }
      final int clientId = int.parse(userId);

      print("========== Current User Info ==========");
      print("ID: $userId");
      print("Name: $userName");
      print("Role: $userType");
      print("Email: $email");
      print("Profile Image: $profileImage");
      print("======================================");

      final selectedTime = generatedHours[selectedHourIndex.value];
      final time = DateFormat.jm().parse(selectedTime);
      final selectedDateTime = DateTime(
        selectedDate.value.year,
        selectedDate.value.month,
        selectedDate.value.day,
        time.hour,
        time.minute,
      );

      final formattedStartDate = DateFormat("yyyy-MM-dd'T'HH:mm").format(selectedDateTime);
      print("Booking: expertId=${expert.value!.id}, clientId=$userId, time=$formattedStartDate");
      final request = BookingRequest(
        expertId: expert.value!.id!,
        clientId: clientId,
        callType: callTypes[selectedCallType.value - 1],
        duration: sessionDurations[selectedSessionIndex.value],
        startDate: formattedStartDate,
        couponCode: couponCode.value.isEmpty ? null : couponCode.value,
        clientSecret: clientSecret.value,
      );

      final result = await _bookingRepository.createBooking(request);
      isLoading.value = false;

      return result.fold(
            (failure) {
          if (failure.err_message.contains('time slot')) {
            Get.snackbar('الوقت غير متاح', 'تم حجز هذا الوقت من قبل. يرجى اختيار وقت آخر.');
            fetchWorkingTimes();
          }
          print("Booking failed: ${failure.err_message}");
          return Left(failure);
        },
            (response) {
          Get.find<myReserveController>().fetchReservations('PENDING');
          Get.snackbar('نجاح', 'تم الحجز بنجاح!');
          Get.toNamed('/confirm', arguments: {'booking': response.data});
          print("Booking successful: ${response.data}");
          return Right(response);
        },
      );
    } catch (e, stackTrace) {
      isLoading.value = false;
      print('Booking error: $e\nStackTrace: $stackTrace');
      return Left(serverFailure('خطأ غير متوقع: $e'));
    }
  }
}