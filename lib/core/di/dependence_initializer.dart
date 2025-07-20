import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/change_password_controller.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/login_controller.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/refresh_token_controller.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/signup_controller.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/verification_code_controller.dart';
import 'package:graduation_project/features/ticket/data/data_source/ticket_service/ticket_service.dart';
import 'package:graduation_project/features/ticket/data/repository/ticket_repository.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/create_ticket_controller.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/get_all_tickets_controller.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/my_tickets_controller.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/page_controller.dart';
import '../../features/Auth/data/data_source/auth_service/auth_service.dart';
import '../../features/Auth/data/repository/auth_repository.dart';
import '../../features/Auth/presentation/controllers/send_code_controller.dart';
import '../../features/Auth/presentation/controllers/verifiy_email_controller.dart';
import '../../features/officers/data/data_source/office_service.dart';
import '../../features/officers/data/repository/OfficeRepository.dart';
import '../../features/officers/presentation/controllers/OfficeController.dart';
import '../../features/properties/data/data_source/property_service.dart';
import '../../features/properties/data/repository/property_repository.dart';
import '../../features/properties/presentation/controllers/Properties_Controller.dart';
import '../../features/ticket/presentation/controllers/get_filtered_tickets_controller.dart';
import '../networks/dio_factory.dart';

class DependenceInitializer {
  static dependenceInjection() async {
    await DioFactory.loadToken();
    Get.lazyPut<Dio>(() => DioFactory.getDio(), fenix: true);
    Get.lazyPut(() => AuthService(Get.find()));
    Get.lazyPut(() => AuthRepository(Get.find()));

    Get.put(RegisterController(Get.find()));
    Get.put(LoginController(Get.find()));
    // Get.put(KeyboardController());
    Get.lazyPut(() => TicketRepositoryImpl(Get.find()));
    Get.lazyPut(() => TicketService(Get.find()));
    Get.lazyPut(() => SendCodeController(Get.find()), fenix: true);
    Get.lazyPut(() => VerificationCodeController(Get.find()), fenix: true);
    Get.lazyPut(() => VerifyEmailController(Get.find()), fenix: true);

    Get.lazyPut(() => PageTicketController(), fenix: true);
    Get.lazyPut(() => CreateTicketController(Get.find()), fenix: true);
    Get.lazyPut(() => FilteredTicketsController(Get.find()), fenix: true);
    Get.lazyPut(() => RefreshTokenController(Get.find()), fenix: true);
    Get.lazyPut(() => GetAllTicketsController(Get.find()), fenix: true);
    Get.lazyPut(() => MyTicketsController(Get.find()), fenix: true);
    //properties
    Get.lazyPut(() => PropertyService(Get.find()));
    Get.lazyPut(() => PropertyRepository(Get.find()));
    Get.lazyPut(() => PropertiesController(Get.find()));
    //offices
    Get.lazyPut(() => OfficeService(Get.find()));
    Get.lazyPut(() => OfficeRepository(Get.find()));
    Get.lazyPut(() => OfficeController(Get.find()));

  }
}
