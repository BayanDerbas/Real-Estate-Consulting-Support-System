import 'package:get/get.dart';
import 'package:graduation_project/features/ticket/data/model/ticket_model.dart';
import 'package:graduation_project/features/ticket/data/repository/ticket_repository.dart';
import '../../../../core/networks/failures.dart';

class GetAllTicketsController extends GetxController {
  final TicketRepositoryImpl _ticketRepository;

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<Ticket> tickets = <Ticket>[].obs;
  final RxList<Ticket> myTickets = <Ticket>[].obs;
  final RxInt currentPage = 0.obs;
  final RxInt totalPages = 1.obs;
  final int pageSize = 5;

  GetAllTicketsController(this._ticketRepository);

  @override
  void onInit() {
    super.onInit();
    fetchTickets(page: 0);
  }

  Future<void> fetchTickets({required int page}) async {
    if (isLoading.value) return;

    isLoading.value = true;
    errorMessage.value = '';
    tickets.clear();

    final result = await _ticketRepository.getAllTickets(
      page: page,
      size: pageSize,
    );

    isLoading.value = false;

    result.fold(
      (Failures failure) {
        print('>>>>>>>ff>>>>>>>>');
        errorMessage.value = failure.err_message;
      },
      (List<Ticket> fetchedTickets) {
        print('>>>>>>>sss>>>>>>>>');
        tickets.assignAll(fetchedTickets);
        currentPage.value = page;
        totalPages.value =
            (fetchedTickets.length < pageSize) ? page + 1 : page + 2;
      },
    );
  }

  void refreshTickets() => fetchTickets(page: 0);
}
