import 'package:get/get.dart';
import 'package:graduation_project/core/networks/dio_factory.dart';
import 'package:graduation_project/features/FAQs_Support/data/data_sources/faqs_service.dart';
import 'package:graduation_project/features/FAQs_Support/data/repositories/faqs_repository.dart';
import '../../../features/FAQs_Support/presentation/controllers/faqs_controller.dart';

class FAQsBinding extends Bindings {
  @override
  void dependencies(){
    final dio = DioFactory.getDio();
    final service = FAQsService(dio);
    Get.lazyPut<FAQsRepository>(() => FAQsRepository(service));
    Get.lazyPut<FAQsController>(() => FAQsController(Get.find()));
  }
}