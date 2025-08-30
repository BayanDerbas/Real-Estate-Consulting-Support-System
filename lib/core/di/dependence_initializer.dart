import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/widgets/Custom_Drawer.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/login_controller.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/refresh_token_controller.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/signup_controller.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/verification_code_controller.dart';
import 'package:graduation_project/features/Book/data/repository/reservation_repository.dart';
import 'package:graduation_project/features/Discounts/data/repositories/all_coupons_repository.dart';
import 'package:graduation_project/features/chats/presentation/controllers/room_controller.dart';
import 'package:graduation_project/features/home/presentation/controllers/Home_Controller.dart';
import 'package:graduation_project/features/posts/data/data_source/post_service.dart';
import 'package:graduation_project/features/posts/data/repository/posts_repository.dart';
import 'package:graduation_project/features/posts/presentation/controllers/PostsController.dart';
import 'package:graduation_project/features/posts/presentation/controllers/create_post_controller.dart';
import 'package:graduation_project/features/properties/presentation/controllers/add_images_to_property_controller.dart';
import 'package:graduation_project/features/properties/presentation/controllers/create_property_controller.dart';
import 'package:graduation_project/features/rating/presentation/controllers/Rating_Controller.dart';
import 'package:graduation_project/features/scheduleTime/presentation/controllers/ScheduleTimeController.dart';
import 'package:graduation_project/features/service%20provider/data/data_source/favourite_unfavorite/favourite_unfavourite_service.dart';
import 'package:graduation_project/features/service%20provider/data/repository/favourite_unfavorite/favourite_unfavourite_repository.dart';
import 'package:graduation_project/features/service%20provider/presentation/controllers/ServiceProvidersControllers.dart';
import 'package:graduation_project/features/ticket/data/data_source/ticket_service/ticket_service.dart';
import 'package:graduation_project/features/ticket/data/repository/ticket_repository.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/create_ticket_controller.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/get_all_tickets_controller.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/my_tickets_controller.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/page_controller.dart';
import 'package:graduation_project/features/timeAvailable/data/data_sources/show_working_times_service.dart';
import 'package:graduation_project/features/timeAvailable/data/repositories/show_working_times_repository.dart';
import '../../features/Auth/data/data_source/auth_service/auth_service.dart';
import '../../features/Auth/data/repository/auth_repository.dart';
import '../../features/Auth/presentation/controllers/keyboard_controller.dart';
import '../../features/Auth/presentation/controllers/send_code_controller.dart';
import '../../features/Auth/presentation/controllers/splash_controller.dart';
import '../../features/Auth/presentation/controllers/verifiy_email_controller.dart';
import '../../features/Book/data/data_source/booking_api_service.dart';
import '../../features/Book/data/data_source/reservation_service.dart';
import '../../features/Book/data/repository/booking_repository.dart';
import '../../features/Discounts/data/data_sources/coupons_service.dart';
import '../../features/Discounts/data/repositories/coupons_repository.dart';
import '../../features/Discounts/data/repositories/expert_coupons_repository.dart';
import '../../features/Discounts/presentation/controllers/DiscountsController.dart';
import '../../features/chats/data/chat_service/chat_service.dart';
import '../../features/chats/data/repository/chat_repository.dart';
import '../../features/myReserve/data/data_sources/myBookings_service.dart';
import '../../features/myReserve/data/data_sources/myReserve_api_service.dart';
import '../../features/myReserve/data/repositories/myBookings_repository.dart';
import '../../features/myReserve/data/repositories/myReserve_repository.dart';
import '../../features/myReserve/presentation/controllers/myBookingsController.dart';
import '../../features/myReserve/presentation/controllers/myReserveController.dart';
import '../../features/notification/data/data_sources/notification_service.dart';
import '../../features/notification/data/repositories/notification_repository.dart';
import '../../features/notification/presentation/controllers/notification_controller.dart';
import '../../features/officers/data/data_source/office_service.dart';
import '../../features/officers/data/repository/OfficeRepository.dart';
import '../../features/officers/presentation/controllers/OfficeController.dart';
import '../../features/profiles/data/data_source/profile_service.dart';
import '../../features/profiles/data/repository/profile_repository.dart';
import '../../features/properties/data/data_source/property_service.dart';
import '../../features/properties/data/repository/property_repository.dart';
import '../../features/properties/presentation/controllers/Properties_Controller.dart';
import '../../features/scheduleTime/data/data_sources/schedule_service.dart';
import '../../features/scheduleTime/data/repositories/time_schedule_repository.dart';
import '../../features/service provider/data/data_source/follow_unfollow/follow_unfollow_service.dart';
import '../../features/service provider/data/data_source/get_posts_by_expertId/get_posts_by_expertId_service.dart';
import '../../features/service provider/data/data_source/rating/rating_service.dart';
import '../../features/service provider/data/repository/expert_posts_repository.dart';
import '../../features/service provider/data/repository/follow_unfollow/follow_unfollow_repository.dart';
import '../../features/service provider/data/repository/rating/rating_repository.dart';
import '../../features/service provider/presentation/controllers/rating_controller.dart';
import '../../features/ticket/presentation/controllers/get_filtered_tickets_controller.dart';
import '../../features/ticket/presentation/controllers/update_ticket_controller.dart';
import '../networks/dio_factory.dart';

class DependenceInitializer {
  static dependenceInjection() async {
    // await DioFactory.loadToken();
    Get.lazyPut<Dio>(() => DioFactory.getDio(), fenix: true);
    Get.lazyPut(() => AuthService(Get.find()));
    Get.lazyPut(() => AuthRepository(Get.find()));
    // Get.find<ProfileService>();
    // Get.find<ProfileRepository>();
    Get.lazyPut(() => ProfileService(Get.find()));
    Get.lazyPut(() => ProfileRepository(Get.find()));
    Get.put(SplashController());
    Get.put(RegisterController(Get.find()));
    Get.put(LoginController(Get.find()));
    Get.put(KeyboardController());
    Get.lazyPut(() => TicketService(Get.find()));
    Get.lazyPut(() => TicketRepositoryImpl(Get.find()));
    Get.put(SendCodeController(Get.find()));
    Get.put(VerificationCodeController(Get.find()));
    Get.put(VerifyEmailController(Get.find()));
    Get.put(RefreshTokenController(Get.find()));

    //chats
    Get.lazyPut(() => ChatService(Get.find()), fenix: true);
    Get.lazyPut(() => ChatRepository(Get.find()), fenix: true);
    Get.put(PageTicketController());

    //put.lazyPut(() => ChatController(Get.find()), fenix: true);
    Get.put(RoomController(Get.find()));
    Get.put(CreateTicketController(Get.find()));
    Get.put(UpdateTicketController(Get.find()));
    Get.put(FilteredTicketsController(Get.find()));
    Get.put(GetAllTicketsController(Get.find()));
    Get.put(MyTicketsController(Get.find()));
    //properties
    Get.lazyPut(() => PropertyService(Get.find()));
    Get.lazyPut(() => PropertyRepository(Get.find()));
    Get.put(PropertiesController(Get.find()));
    Get.put(CreatePropertyController(Get.find()));
    Get.put(AddImagesToPropertyController(Get.find()));
    //offices
    Get.lazyPut(() => OfficeService(Get.find()));
    Get.lazyPut(() => OfficeRepository(Get.find()));
    Get.put(OfficeController(Get.find()));
    // show working time
    Get.lazyPut<show_workingTimes_service>(
      () => show_workingTimes_service(Get.find()),
    );
    Get.lazyPut<ShowWorkingTimesRepository>(
      () => ShowWorkingTimesRepositoryImpl(service: Get.find()),
    );
    // Booking dependencies
    Get.lazyPut<BookingService>(() => BookingService(Get.find<Dio>()));
    Get.lazyPut<BookingRepository>(
      () => BookingRepositoryImpl(Get.find<BookingService>()),
    );

    Get.lazyPut<ReservationService>(() => ReservationService(Get.find<Dio>()));
    Get.lazyPut<ReservationRepository>(
      () => ReservationRepository(Get.find<ReservationService>()),
    );
    // Get.put(BookController(
    //   Get.find<ReservationRepository>(),
    //   Get.find<BookingRepository>(),
    //   ),
    // );

    // MyReserve dependencies
    Get.lazyPut<MyReserveService>(() => MyReserveService(Get.find<Dio>()));
    Get.lazyPut(() => MyReserveRepositoryImpl(Get.find<MyReserveService>()));
    Get.put(myReserveController(Get.find<MyReserveRepositoryImpl>()));
    // expert Reservations
    Get.lazyPut<ReservationService>(() => ReservationService(Get.find()));
    Get.lazyPut<ReservationRepository>(() => ReservationRepository(Get.find()));
    //posts
    Get.lazyPut(() => PostService(Get.find()));
    Get.lazyPut(() => PostsRepository(Get.find()));
    Get.put(CreatePostController(Get.find()));
    //posts
    Get.lazyPut(() => PostService(Get.find()));
    Get.lazyPut(() => PostsRepository(Get.find()));
    Get.put(CreatePostController(Get.find()));
    Get.put(PostsController(Get.find()));
    //rating
    Get.lazyPut(() => RatingService(Get.find()),fenix: true);
    Get.lazyPut(() => RatingRepository(Get.find()),fenix: true);
    Get.lazyPut<RatingController>(() => RatingController(Get.find()), fenix: true);
    // Follow/Unfollow
    Get.lazyPut(() => Follow_UnFollow_service(Get.find()),fenix: true);
    Get.lazyPut(() => Follow_UnFollow_Repository(Get.find()),fenix: true);
    //favourite/unfavourite
    Get.lazyPut(() => Favourite_UnFavourite_Service(Get.find()),fenix: true);
    Get.lazyPut(() => Favourite_UnFavourite_Repository(Get.find()),fenix: true);
    // last edit
    Get.lazyPut(() =>ServiceProviders_Controller(Get.find(),Get.find()), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(Get.find()), fenix: true);
    Get.put(CustomDrawerController());
    //create coupon
    Get.lazyPut(() => CouponsService(Get.find()), fenix: true);
    Get.lazyPut(() => CouponsRepository(Get.find()), fenix: true);
    Get.lazyPut<DiscountsController>(
      () => DiscountsController(Get.find(), Get.find()),
      fenix: true,
    );
    //my Booking (users)
    Get.lazyPut<MyBookingsApi>(() => MyBookingsApi(Get.find<Dio>()));
    Get.lazyPut<MyBookingsRepository>(
      () => MyBookingsRepository(Get.find<MyBookingsApi>()),
    );
    Get.put(MyBookingsController(Get.find<MyBookingsRepository>()));
    //show posts expert
    Get.lazyPut(() => ShowPostsbyExpertId(Get.find<Dio>()), fenix: true);
    Get.lazyPut(
      () => ExpertPostsRepository(Get.find<ShowPostsbyExpertId>()),
      fenix: true,
    );
    // get expert coupons
    Get.lazyPut(
      () => ExpertCouponsRepository(Get.find<CouponsService>()),
      fenix: true,
    );
    //get_all_coupons
    Get.lazyPut(() => AllCouponsRepository(Get.find()), fenix: true);
    //schedule time
    Get.lazyPut<ScheduleService>(
      () => ScheduleService(Get.find<Dio>()),
      fenix: true,
    );
    Get.lazyPut<ScheduleTimeRepository>(
      () => ScheduleTimeRepository(Get.find<ScheduleService>()),
      fenix: true,
    );
    Get.lazyPut<ScheduleTimeController>(
      () => ScheduleTimeController(Get.find<ScheduleTimeRepository>()),
      fenix: true,
    );
    // Notifications
    Get.lazyPut(() => NotificationService(Get.find()), fenix: true);
    Get.lazyPut(() => NotificationRepository(Get.find()), fenix: true);
    Get.lazyPut(() => NotificationController(Get.find()), fenix: true);
  }
}