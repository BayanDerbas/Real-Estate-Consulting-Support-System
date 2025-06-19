import 'package:get/get.dart';
import 'package:graduation_project/core/di/bindings/verification_binds.dart';
import 'package:graduation_project/features/Auth/presentation/pages/continue_info_for_expert.dart';
import 'package:graduation_project/features/Auth/presentation/pages/login_screen.dart';
import 'package:graduation_project/features/Auth/presentation/pages/otp_page.dart';
import 'package:graduation_project/features/Auth/presentation/pages/sign_up_screen.dart';
import 'package:graduation_project/features/Auth/presentation/pages/upload_documents.dart';
import 'package:graduation_project/features/properties/presentation/pages/properties.dart';
import 'package:graduation_project/features/rating/presentation/pages/Rating.dart';
import 'package:graduation_project/features/Book/presentation/pages/Book.dart';
import 'package:graduation_project/features/scheduleTime/presentation/pages/ScheduleTime.dart';
import 'package:graduation_project/features/wallet/presentation/pages/Wallet.dart';
import '../../features/Book/presentation/pages/Confirm.dart';
import '../../features/Discounts/presentation/pages/Discounts.dart';
import '../../features/home/presentation/pages/Home.dart';
import '../../features/posts/presentation/pages/Posts.dart';
import '../../features/properties/presentation/pages/PropertyDetails.dart';
import '../../features/service provider/presentation/pages/ServiceProviderProfile.dart';
import '../../features/service provider/presentation/pages/ServiceProviders.dart';

class AppRoutes {
  static const String home = "/home";
  static const String login = '/login';
  static const String signup = '/signup';
  static const String verificationCode = '/verification_code';
  static const String uploadDocuments = '/upload_documents';
  static const String properties = '/properties';
  static const String propertyDetails = '/propertyDetails';
  static const String serviceProviders = '/serviceProviders';
  static const String posts = '/posts';
  static const String rating = '/rating';
  static const String serviceProvider_profile = '/serviceProvider_profile';
  static const String book = '/Book';
  static const String confirm = '/confirm';
  static const String wallet = '/wallet';
  static const String scheduleTime = '/scheduleTime';
  static const String discounts = '/discounts';
  static const String continueFillExpertInfo = '/continue_fill_expert_info';
  static List<GetPage> routes_ = [
    GetPage(name: discounts, page: () => Discounts()),
    GetPage(name: scheduleTime, page: () => Scheduletime()),
    GetPage(name: wallet, page: () => Wallet()),
    GetPage(name: confirm, page: () => Confirm()),
    GetPage(name: book, page: () => Book()),
    GetPage(
      name: serviceProvider_profile,
      page: () => Serviceproviderprofile(),
    ),
    GetPage(name: rating, page: () => Rating()),
    GetPage(name: posts, page: () => Posts()),
    GetPage(name: serviceProviders, page: () => ServiceProviders()),
    GetPage(name: propertyDetails, page: () => PropertyDetails()),
    GetPage(name: properties, page: () => Properties()),
    GetPage(name: home, page: () => Home()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(
      name: verificationCode,
      page: () => OtpPage(),
      binding: VerificationBinding(),
    ),
    GetPage(name: signup, page: () => SignUpScreen()),
    GetPage(name: uploadDocuments, page: () => UploadDocuments()),
    GetPage(name: continueFillExpertInfo, page: () => ContinueInfoForExpert()),
  ];
}
