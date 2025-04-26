import 'package:get/get.dart';
import '../../features/home/presentation/pages/Home.dart';

class routes{
  static const String home = "/home";
  static List<GetPage> routes_ = [
    GetPage(name: home, page:() => const Home()),
  ];
}