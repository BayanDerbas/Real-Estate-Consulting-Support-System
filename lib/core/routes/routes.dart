import 'package:get/get.dart';
import 'package:graduation_project/core/di/bindings/create_ticket_binds.dart';
import 'package:graduation_project/features/Auth/presentation/pages/continue_info_for_expert.dart';
import 'package:graduation_project/features/Auth/presentation/pages/login_screen.dart';
import 'package:graduation_project/features/Auth/presentation/pages/splash_screen.dart';
import 'package:graduation_project/features/Auth/presentation/pages/verification_code.dart';
import 'package:graduation_project/features/Auth/presentation/pages/sign_up_screen.dart';
import 'package:graduation_project/features/Auth/presentation/pages/upload_documents.dart';
import 'package:graduation_project/features/Auth/presentation/pages/verify_email_page.dart';
import 'package:graduation_project/features/myReserve/presentation/controllers/myReserveController.dart';
import 'package:graduation_project/features/officers/presentation/controllers/OfficeController.dart';
import 'package:graduation_project/features/posts/presentation/pages/create_post.dart';
import 'package:graduation_project/features/properties/presentation/controllers/Properties_Controller.dart';
import 'package:graduation_project/features/properties/presentation/pages/properties.dart';
import 'package:graduation_project/features/rating/presentation/pages/Rating.dart';
import 'package:graduation_project/features/Book/presentation/pages/Book.dart';
import 'package:graduation_project/features/scheduleTime/presentation/pages/ScheduleTime.dart';
import 'package:graduation_project/features/service%20provider/presentation/controllers/ServiceProvidersControllers.dart';
import 'package:graduation_project/features/ticket/presentation/pages/base_tickets_page.dart';
import 'package:graduation_project/features/ticket/presentation/pages/filter_tickets.dart';
import 'package:graduation_project/features/ticket/presentation/pages/my_tickets.dart';
import 'package:graduation_project/features/wallet/presentation/pages/Wallet.dart';
import '../../features/Auth/presentation/pages/change_password.dart';
import '../../features/Auth/presentation/pages/refresh_token_page.dart';
import '../../features/Book/presentation/pages/Confirm.dart';
import '../../features/Discounts/presentation/pages/Discounts.dart';
import '../../features/chats/presentation/pages/chat_page.dart';
import '../../features/home/presentation/pages/Home.dart';
import '../../features/myReserve/presentation/pages/MyReserve.dart';
import '../../features/notification/presentation/pages/notification.dart';
import '../../features/officers/presentation/pages/offices.dart';
import '../../features/posts/presentation/pages/Posts.dart';
import '../../features/properties/presentation/pages/PropertyDetails.dart';
import '../../features/properties/presentation/pages/add_images_to_property.dart';
import '../../features/properties/presentation/pages/create_property.dart';
import '../../features/service provider/presentation/pages/ServiceProviderProfile.dart';
import '../../features/service provider/presentation/pages/ServiceProviders.dart';
import '../../features/ticket/presentation/controllers/get_all_tickets_controller.dart';
import '../../features/ticket/presentation/pages/all_tickets.dart';
import '../../features/ticket/presentation/pages/publish_ticket.dart';
import '../di/bindings/booking_bind.dart';
import '../di/bindings/change_password_bind.dart';
import '../middlewares/my_middleware.dart';

class AppRoutes {
  static const String splashScreen = "/";
  static const String home = "/home";
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/email_verify';
  static const String resetPassword = '/reset_password';
  static const String verificationCode = '/verification_code';
  static const String refreshToken = '/refresh_token';
  static const String uploadDocuments = '/upload_documents';
  static const String properties = '/properties';
  static const String propertyDetails = '/propertyDetails';
  static const String serviceProviders = '/serviceProviders';
  static const String offices = '/offices';
  static const String posts = '/posts';
  static const String rating = '/rating';
  static const String serviceProvider_profile = '/serviceProvider_profile';
  static const String book = '/Book';
  static const String confirm = '/confirm';
  static const String wallet = '/wallet';
  static const String scheduleTime = '/scheduleTime';
  static const String discounts = '/discounts';
  static const String continueFillExpertInfo = '/continue_fill_expert_info';
  // static const String changePassword = '/change_password';
  static const String createTicket = "/create_ticket";
  static const String allTickets = '/all_tickets';
  static const String myTickets = '/my_tickets';
  static const String filteredTickets = '/filtered_tickets';
  static const String baseTicketsPage = '/base_tickets_page';
  static const String chatPage = '/chat_page';
  static const String createPost = '/create_post';
  static const String notifications = '/notifications';
  static const String myReserve = '/myReserve';
  static const String myTimes = '/my_times';
  static const String createProperty = '/create_property';
  static const String addImagesToProperty = '/add_images_to_property';

  static List<GetPage> routes_ = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: refreshToken, page: () => RefreshTokenPage()),
    GetPage(
      name: myReserve,
      page: () => const MyReserve(),
      binding: BindingsBuilder(() {
        final controller = Get.find<myReserveController>();
        controller.loadCashedReservations();
        controller.fetchReservations(controller.selectedStatus.value);
      }),
    ),
    GetPage(name: discounts, page: () => Discounts()),
    GetPage(name: scheduleTime, page: () => Scheduletime()),
    GetPage(name: wallet, page: () => Wallet()),
    GetPage(name: confirm, page: () => Confirm()),
    GetPage(name: book, page: () => Book(), binding: BookingBinding()),
    GetPage(
      name: serviceProvider_profile,
      page: () => Serviceproviderprofile(),
    ),
    GetPage(name: rating, page: () => Rating()),
    GetPage(name: posts, page: () => Posts()),
    GetPage(name: serviceProviders, page: () => ServiceProviders()),
    GetPage(name: propertyDetails, page: () => PropertyDetails()),
    GetPage(name: properties, page: () => Properties()),
    GetPage(
      name: home,
      page: () => Home(),
      binding: BindingsBuilder(() {
        Get.find<PropertiesController>().fetchProperties();
        Get.find<OfficeController>().fetchOffices();
        Get.find<ServiceProviders_Controller>().fetchExperts();
      }),
    ),
    GetPage(name: offices, page: () => Offices()),
    GetPage(
      name: login,
      page: () => LoginScreen(),
      middlewares: [MyMiddleware()],
    ),
    GetPage(name: verificationCode, page: () => OtpPage()),
    GetPage(name: signup, page: () => SignUpScreen()),
    GetPage(name: uploadDocuments, page: () => UploadDocuments()),
    GetPage(name: continueFillExpertInfo, page: () => ContinueInfoForExpert()),

    // GetPage(name: changePassword, page: () => ResetPassword()),
    GetPage(
      name: createTicket,
      page: () => CreateTicketScreen(),
      binding: TicketBinding(),
    ),
    GetPage(
      name: allTickets,
      page: () => TicketsPage(),
      //binding: GetAllTicketsBinding(),
    ),
    GetPage(
      name: baseTicketsPage,
      page: () => BaseTicketsPage(),
      binding: BindingsBuilder(() {
        Get.find<GetAllTicketsController>().fetchTickets(page: 0);
      }),
    ),
    GetPage(
      name: myTickets,
      page: () => MyTickets(),
      // binding: MyTicketsBinds(),
    ),
    GetPage(name: filteredTickets, page: () => FilteredTicketPage()),
    GetPage(name: createPost, page: () => CreatePostPage()),
    GetPage(name: forgotPassword, page: () => VerifyEmailPage()),
    // GetPage(
    //   name: resetPassword,
    //   page: () => ResetPassword1(),
    //   binding: ResetPasswordBinding(),
    // ),
    GetPage(name: chatPage, page: () => ChatPage()),
    GetPage(name: notifications, page: () => NotificationsScreen()),
    GetPage(name: createProperty, page: () => CreatePropertyScreen()),
    // GetPage(name: addImagesToProperty, page: () => AddImagesToPropertyScreen()),
  ];
}
