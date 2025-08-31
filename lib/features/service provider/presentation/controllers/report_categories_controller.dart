import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/networks/failures.dart';
import '../../data/model/report/report_category_model.dart';
import '../../data/model/report/report_response_model.dart';
import '../../data/repository/report/report_categories_repository.dart';
import '../../data/model/report/report_request.dart';

class ReportCategoriesController extends GetxController {
  final ReportRepository repository;
  ReportCategoriesController({required this.repository});

  final isLoading = false.obs;
  final categories = <ReportCategory>[].obs;
  final error = RxnString();

  final isSending = false.obs;
  final sendError = RxnString();
  final sendSuccess = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  Future<void> loadCategories() async {
    isLoading.value = true;
    error.value = null;
    final Either<Failures, List> result = await repository.fetchCategories();
    result.fold(
          (l) => error.value = l.err_message,
          (r) {
        categories.assignAll(r.cast<ReportCategory>());
      },
    );
    isLoading.value = false;
  }

  Future<void> sendReport({
    required int categoryId,
    required String description,
    required int reportedUserId,
  }) async {
    isSending.value = true;
    sendError.value = null;
    sendSuccess.value = false;

    final request = ReportRequest(
      categoryId: categoryId,
      description: description,
      reportedUserId: reportedUserId,
    );

    final Either<Failures, ReportResponseModel> result =
    await repository.createReport(request);

    result.fold(
          (failure) {
        sendError.value = failure.err_message;
        print("Error : $sendError");
      },
          (response) {
        sendSuccess.value = true;
        print("Success : $sendSuccess");
      },
    );
    isSending.value = false;
  }
}
