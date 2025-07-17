import 'package:get/get.dart';
import 'package:graduation_project/core/networks/failures.dart';
import 'package:graduation_project/features/ticket/data/model/ticket_data_model.dart';
import 'package:graduation_project/features/ticket/data/repository/ticket_repository.dart';
import 'package:graduation_project/features/ticket/data/model/filter_tickets_request_model.dart'
    as filter;

class FilteredTicketsController extends GetxController {
  final TicketRepositoryImpl _ticketRepository;

  FilteredTicketsController(this._ticketRepository);

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<TicketDataModel> tickets = <TicketDataModel>[].obs;

  filter.FilterTicketsModel? currentFilter;

  Future<void> fetchFilteredTickets(
    filter.FilterTicketsModel filterModel,
  ) async {
    if (isLoading.value) return;

    isLoading.value = true;
    errorMessage.value = '';
    currentFilter = filterModel;

    final result = await _ticketRepository.getFilteredTickets(
      filter: filterModel,
    );

    isLoading.value = false;

    result.fold(
      (Failures failure) {
        print('/////////////////faluuuuuuu');
        errorMessage.value = failure.err_message;
        tickets.clear();
      },
      (filteredData) {
        print('/////////////////sucesss${filteredData}');
        tickets.assignAll(filteredData);
      },
    );
  }

  void refreshFilteredTickets() {
    if (currentFilter != null) {
      fetchFilteredTickets(currentFilter!);
    }
  }
}
