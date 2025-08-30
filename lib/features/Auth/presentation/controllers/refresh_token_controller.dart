// import 'dart:developer';
//
// import 'package:get/get.dart';
// import 'package:graduation_project/core/routes/routes.dart';
// import 'package:graduation_project/core/utils/secure_storage.dart';
// import 'package:graduation_project/features/Auth/data/model/refresh_token_model.dart';
// import 'package:graduation_project/features/Auth/data/repository/auth_repository.dart';
// import 'package:graduation_project/features/calls/calls_service.dart';
//
// import '../../../../core/networks/dio_factory.dart';
//
// class RefreshTokenController extends GetxController {
//   final AuthRepository _repository;
//
//   RefreshTokenController(this._repository);
//
//   RxBool isLoading = false.obs;
//   RxString errMessage = "".obs;
//
//   Future<void> refreshToken() async {
//     isLoading(true);
//     errMessage("");
//     final data = await _repository.refreshToken(
//       RefreshRequestModel(
//         refreshToken: await SecureStorage().getRefreshToken(),
//       ),
//     );
//     data.fold((l) => errMessage(l.err_message), (r) {
//       log("token: ${r.token}");
//       SecureStorage storage = SecureStorage();
//
//       storage.saveToken(r.token!);
//       storage.saveRefreshToken(r.refreshToken!);
//
//       DioFactory.setToken(r.token!);
//     });
//     isLoading(false);
//
//     if (errMessage.isEmpty) {
//       Get.offNamed(AppRoutes.home);
//       return;
//     }
//   }
// }
import 'dart:developer';
import 'package:get/get.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/Auth/data/model/refresh_token_model.dart';
import 'package:graduation_project/features/Auth/data/repository/auth_repository.dart';
import 'package:graduation_project/features/calls/calls_service.dart'; // <-- 1. Import CallServices
import '../../../../core/networks/dio_factory.dart';
import '../../../myReserve/presentation/controllers/myBookingsController.dart';
import '../../../myReserve/presentation/controllers/myReserveController.dart';
import '../../../officers/presentation/controllers/OfficeController.dart';
import '../../../posts/presentation/controllers/PostsController.dart';
import '../../../properties/presentation/controllers/Properties_Controller.dart';
import '../../../service provider/presentation/controllers/ServiceProvidersControllers.dart';

class RefreshTokenController extends GetxController {
  final AuthRepository _repository;
  final CallServices _callServices = CallServices();
  final SecureStorage _storage = SecureStorage();

  RefreshTokenController(this._repository);

  RxBool isLoading = false.obs;
  RxString errMessage = "".obs;

  Future<void> refreshToken() async {
    isLoading(true);
    errMessage("");
    // DioFactory.clearToken();
    final data = await _repository.refreshToken(
      RefreshRequestModel(refreshToken: await _storage.getRefreshToken()),
    );

    await data.fold((l) => errMessage(l.err_message), (r) async {
      log("R token: ${r.token}");
      // await _storage.saveToken(r.token!);
      // await _storage.saveRefreshToken(r.refreshToken!);

      DioFactory.setToken(r.token!);

      log("Token refresh successful. Initializing Zego...");
      final userId = await _storage.getUserId();
      final userName = await _storage.getUserName();

      if (userId != null && userName != null) {
        await _callServices.onUserLogin(userId.toString(), userName);
        log("Zego initialized for user: $userName ($userId)");
      } else {
        log("Error: Could not find user ID or Name to initialize Zego.");
        errMessage("User data is missing, please log in again.");
      }
    });

    isLoading(false);

    if (errMessage.isEmpty) {
      Get.find<PropertiesController>().fetchProperties();
      Get.find<OfficeController>().fetchOffices();
      Get.find<ServiceProviders_Controller>().filter();
      Get.find<PostsController>().showPosts();

      Get.find<myReserveController>().loadRole();

      Get.offNamed(AppRoutes.home);
      return;
    }
  }
}
