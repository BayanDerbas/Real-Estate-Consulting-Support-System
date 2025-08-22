import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/Book/data/repository/reservation_repository.dart';
import '../../../features/Book/data/data_source/booking_api_service.dart';
import '../../../features/Book/data/data_source/reservation_service.dart';
import '../../../features/Book/data/repository/booking_repository.dart';
import '../../../features/Book/presentation/controllers/BookController.dart';
import '../../../features/timeAvailable/data/repositories/show_working_times_repository.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingService>(() => BookingService(Get.find<Dio>()), fenix: true);
    Get.lazyPut<BookingRepository>(() => BookingRepositoryImpl(Get.find<BookingService>()), fenix: true);
    Get.lazyPut<ReservationService>(() => ReservationService(Get.find<Dio>()), fenix: true);
    Get.lazyPut<ReservationRepository>(() => ReservationRepository(Get.find<ReservationService>()), fenix: true);
    // Get.lazyPut(() => BookController(
    //   Get.find<ReservationRepository>(),
    //   Get.find<BookingRepository>(),
    // ));
  }
}