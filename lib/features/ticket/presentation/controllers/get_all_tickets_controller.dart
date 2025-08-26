import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/ticket/data/model/ticket_model.dart';
import 'package:graduation_project/features/ticket/data/repository/ticket_repository.dart';
import '../../../../core/networks/failures.dart';
import '../../data/model/filter_model.dart';

class GetAllTicketsController extends GetxController {
  final TicketRepositoryImpl _repository;

  GetAllTicketsController(this._repository);

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<Ticket> tickets = <Ticket>[].obs;

  final ScrollController scrollController = ScrollController();
  RxBool last = false.obs;

  get length => tickets.length;

  Future<void> filter({
    List<FilterItemModel>? filterItems,
    GlobalOperatorEnum globalOperator = GlobalOperatorEnum.AND,
    PageRequestModel? pageRequest,
  }) async {
    isLoading(true);
    errorMessage("");

    FilterModel model = FilterModel(
      filterItems: filterItems ?? [],
      globalOperator: globalOperator,
      pageRequest: pageRequest ?? PageRequestModel(page: 0, size: 10),
    );

    final data = await _repository.filterTickets(model);
    data.fold((l) => errorMessage(l.err_message), (r) {
      if (pageRequest == null) {
        tickets.clear();
      }
      tickets.addAll(r.data?.content ?? []);
      last(r.data?.last ?? false);
    });
    isLoading(false);
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
