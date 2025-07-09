import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/ticket/data/model/ticket_model.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/my_tickets_controller.dart';
import 'package:graduation_project/features/ticket/presentation/widgets/my_ticket_card.dart';

import '../../../../core/widgets/Custom_PaginationBar.dart';

class MyTickets extends GetView<MyTicketsController> {
  const MyTickets({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "طلباتي",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.myTickets.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              controller.errorMessage.value,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (controller.myTickets.isEmpty) {
          return const Center(child: Text("لا يوجد طلبات حالياً"));
        }

        return Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async => controller.refreshTickets(),
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.myTickets.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final Ticket ticket = controller.myTickets[index];
                    final user = ticket.client.user;

                    return MyTicketCard(
                      fullName:
                          '${user?.firstName ?? "بدون"} ${user?.lastName ?? ""}',
                      phone: user?.phone ?? "رقم غير معروف",
                      location: ticket.location,
                      description: ticket.description,
                      priceRange: '${ticket.lowPrice} - ${ticket.highPrice}',
                      width: screenWidth,
                      height: 200,
                    );
                  },
                ),
              ),
            ),
            Obx(
              () => CustomPaginationBar(
                totalPages: controller.totalPages.value,
                currentPage: controller.currentPage.value,
                onPageSelected: (page) => controller.fetchTickets(page: page),
              ),
            ),
            const SizedBox(height: 12),
          ],
        );
      }),
    );
  }
}
