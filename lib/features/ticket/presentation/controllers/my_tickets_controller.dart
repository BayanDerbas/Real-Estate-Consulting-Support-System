import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/ticket/data/model/ticket_model.dart';
import 'package:graduation_project/features/ticket/data/repository/ticket_repository.dart';
import '../../../../core/networks/failures.dart';
import '../../data/model/filter_model.dart';

class MyTicketsController extends GetxController {
  final TicketRepositoryImpl _repository;

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<Ticket> myTickets = <Ticket>[].obs;

  MyTicketsController(this._repository);
  final SecureStorage _storage = SecureStorage();

  final ScrollController scrollController = ScrollController();
  RxBool last = false.obs;

  get length => myTickets.length;

  Future<void> filter({
    List<FilterItemModel>? filterItems,
    GlobalOperatorEnum globalOperator = GlobalOperatorEnum.AND,
    PageRequestModel? pageRequest,
  }) async {
    final userIdStr = await _storage.getIdByRole();
    final userIdInt = int.parse(userIdStr!);

    isLoading(true);
    errorMessage("");

    FilterModel model = FilterModel(
      filterItems: filterItems ?? [],
      globalOperator: globalOperator,
      pageRequest: pageRequest ?? PageRequestModel(page: 0, size: 10),
    );

    model.filterItems?.add(
      FilterItemModel(
        column: 'id',
        value: userIdInt,
        operation: OperationEnum.JOIN,
        joinTable: 'client',
      ),
    );

    final data = await _repository.filterTickets(model);
    data.fold((l) => errorMessage(l.err_message), (r) {
      if (pageRequest == null) {
        myTickets.clear();
      }
      myTickets.addAll(r.data?.content ?? []);
      last(r.data?.last ?? false);
    });

    isLoading(false);
  }

  Future<void> deleteTicket(int ticketId) async {
    final result = await _repository.deleteTicket(ticketId);
    result.fold(
      (failure) => Get.snackbar(
        'Error',
        failure.err_message ?? 'Failed to delete ticket',
      ),
      (_) {
        Get.back();

        final myTicketController = Get.find<MyTicketsController>();
        myTicketController.filter();
        Get.toNamed(AppRoutes.baseTicketsPage);
        Get.snackbar(
          'Success',
          'ticket deleted successfully',
          duration: Duration(seconds: 2),
          backgroundColor: AppColors.deepNavy,
          colorText: AppColors.pureWhite,
        );
      },
    );
  }

  loadMoreDate() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        last.isFalse) {
      filter(pageRequest: PageRequestModel(page: length ~/ 10, size: 10));
    }
  }

  @override
  void onInit() {
    scrollController.addListener(() => loadMoreDate());
    super.onInit();
  }
}
