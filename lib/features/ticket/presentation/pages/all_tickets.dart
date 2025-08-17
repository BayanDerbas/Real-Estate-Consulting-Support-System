import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/features/ticket/data/model/ticket_model.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/get_all_tickets_controller.dart';
import 'package:graduation_project/features/ticket/presentation/widgets/my_ticket_card.dart';
import '../../../../core/widgets/Custom_PaginationBar.dart';
import '../../../../core/constants/fonts.dart';

class TicketsPage extends GetView<GetAllTicketsController> {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softWhite,
      body: Obx(() => _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (controller.isLoading.value && controller.tickets.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.purple),
      );
    }

    if (controller.errorMessage.isNotEmpty) {
      return Center(
        child: Text(
          controller.errorMessage.value,
          style: const TextStyle(
            color: AppColors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    if (controller.tickets.isEmpty) {
      return Center(
        child: Text(
          "لا يوجد طلبات حالياً".tr,
          style: Fonts.taj.copyWith(color: AppColors.deepNavy.withOpacity(0.6)),
        ),
      );
    }

    return _buildTicketsView(context);
  }

  Widget _buildTicketsView(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            color: AppColors.purple,
            onRefresh: () async {
              controller.refreshTickets();
            },
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: controller.tickets.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final Ticket ticket = controller.tickets[index];
                final user = ticket.client;

                return MyTicketCard(
                  fullName:
                      '${user.firstName}${user.lastName}' ?? "غير معروف".tr,
                  location: ticket.location,
                  description: ticket.description,
                  priceRange: '${ticket.lowPrice} - ${ticket.highPrice}',
                  width: currentWidth,
                  height: 300,
                );
              },
            ),
          ),
        ),
        if (controller.totalPages.value > 1)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: CustomPaginationBar(
              totalPages: controller.totalPages.value,
              currentPage: controller.currentPage.value,
              onPageSelected: (page) => controller.fetchTickets(page: page),
            ),
          ),
      ],
    );
  }
}
