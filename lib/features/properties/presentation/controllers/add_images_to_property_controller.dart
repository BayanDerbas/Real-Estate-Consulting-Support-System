import 'package:get/get.dart';
import 'package:graduation_project/features/properties/data/repository/property_repository.dart';

class AddImagesToPropertyController extends GetxController {
  final PropertyRepository _propertyRepository;
  AddImagesToPropertyController(this._propertyRepository);
  late int propertyId = 0;
  @override
  void onInit() {
    super.onInit();
    propertyId = Get.arguments as int;
  }
}
