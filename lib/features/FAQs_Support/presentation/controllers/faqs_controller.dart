import 'dart:developer';
import 'package:get/get.dart';
import 'package:graduation_project/core/networks/dio_factory.dart';
import 'package:graduation_project/features/FAQs_Support/data/repositories/faqs_repository.dart';
import '../../data/models/faqs_item_model.dart';

class FAQsController extends GetxController{
  final FAQsRepository repository;
  FAQsController(this.repository);
   var isLoading = false.obs;
   var errorMessage = ''.obs;
   var items = <FAQItem>[].obs;

   var page = 0;
   final size = 10;
   var isLastPage = false.obs;

   @override
  void onInit(){
     super.onInit();
     getFAQs(refresh: true);
   }

   Future <void> getFAQs({bool refresh = false}) async {
     if(isLoading.value) return;
     if(isLastPage.value && !refresh) return;

     isLoading.value = true;
     errorMessage.value = '';

     if (refresh) {
       page = 0;
       isLastPage.value = false;
       items.clear();
     }

     await DioFactory.loadToken();
     final result = await repository.getFAQs(page, size);
     result.fold(
             (failure) {
               errorMessage.value = failure.err_message;
               log("FAQs Error: ${failure.err_message}");
             },
             (response){
               final content = response.data!.content ?? <FAQItem>[];
               items.addAll(content);
               isLastPage.value = response.data!.last ?? true;
               log("FAQs fetched: ${items.length} (page $page)");
               page++;
             },
     );
   }
}