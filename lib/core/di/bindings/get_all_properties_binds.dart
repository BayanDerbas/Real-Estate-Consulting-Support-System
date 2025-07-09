import 'package:get/get.dart';
import 'package:graduation_project/features/properties/data/repository/property_repository.dart';
import 'package:graduation_project/features/properties/presentation/controllers/Properties_Controller.dart';

class PropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertiesController>(
      () => PropertiesController(Get.find<PropertyRepository>()),
    );
  }
}
