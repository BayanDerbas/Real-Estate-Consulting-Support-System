import 'package:get/get.dart';
import 'package:graduation_project/features/Auth/presentation/pages/login_screen.dart';
import 'package:graduation_project/features/Auth/presentation/pages/sign_up_screen.dart';
import 'package:graduation_project/features/Auth/presentation/pages/upload_documents.dart';
import 'package:graduation_project/features/properties/presentation/pages/properties.dart';
import '../../features/home/presentation/pages/Home.dart';
import '../../features/properties/presentation/pages/PropertyDetails.dart';

class AppRoutes {
  static const String home = "/home";
  static const String login = '/login';
  static const String signup = '/signup';
  static const String uploadDocuments = '/upload_documents';
  static const String properties = '/properties';
  static const String propertyDetails = '/propertyDetails';

  static List<GetPage> routes_ = [
    GetPage(name: propertyDetails, page: () => const PropertyDetails()),
    GetPage(name: properties, page: () => const Properties()),
    GetPage(name: home, page: () => const Home()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: signup, page: () => SignUpScreen()),
    GetPage(name: uploadDocuments, page: () => UploadDocuments()),
  ];
}
