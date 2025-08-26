import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/ticket/data/model/ticket_model.dart';
import 'package:graduation_project/features/ticket/data/repository/ticket_repository.dart';
import '../../../../core/networks/failures.dart';

class MyTicketsController extends GetxController {
  final TicketRepositoryImpl _ticketRepository;

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<Ticket> myTickets = <Ticket>[].obs;
  final RxInt currentPage = 0.obs;
  final RxInt totalPages = 1.obs;
  final int pageSize = 5;

  MyTicketsController(this._ticketRepository);
  final SecureStorage _storage = SecureStorage();

  Future<void> fetchTickets({required int page}) async {
    if (isLoading.value) return;

    final userIdStr = await _storage.getIdByRole();
    final userIdInt = int.parse(userIdStr!);

    isLoading.value = true;
    errorMessage.value = '';
    myTickets.clear();

    final result = await _ticketRepository.getMyTickets(
      page: page,
      size: pageSize,
      userId: userIdInt,
    );

    isLoading.value = false;

    result.fold(
      (Failures failure) {
        errorMessage.value = failure.err_message;
      },
      (fetchedTickets) {
        print('......................mt tickets');

        myTickets.assignAll(fetchedTickets);

        currentPage.value = page;
        totalPages.value =
            (fetchedTickets.length < pageSize) ? page + 1 : page + 2;
      },
    );
  }

  void refreshTickets() => fetchTickets(page: 0);
}
