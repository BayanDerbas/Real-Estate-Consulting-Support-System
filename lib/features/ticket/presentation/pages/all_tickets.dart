import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/features/ticket/data/model/ticket_model.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/get_all_tickets_controller.dart';
import 'package:graduation_project/features/ticket/presentation/widgets/my_ticket_card.dart';

import '../../../../core/widgets/Custom_PaginationBar.dart';
import '../../../../core/constants/fonts.dart';

class TicketsPage extends GetView<GetAllTicketsController> {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.softWhite,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        title: Text(
          "كل الطلبات",
          style: Fonts.itim.copyWith(
            color: AppColors.pureWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 4,
        shadowColor: AppColors.deepNavy.withOpacity(0.3),
      ),
      body: Obx(() {
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
              "لا يوجد طلبات حالياً",
              style: Fonts.taj.copyWith(
                color: AppColors.deepNavy.withOpacity(0.6),
              ),
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                color: AppColors.purple,
                onRefresh: () async => controller.refreshTickets(),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  itemCount: controller.tickets.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final Ticket ticket = controller.tickets[index];
                    final user = ticket.client.user;

                    return MyTicketCard(
                      fullName:
                          '${user?.firstName ?? "بدون"} ${user?.lastName ?? ""}',
                      phone: user?.phone ?? "رقم غير معروف",
                      location: ticket.location,
                      description: ticket.description,
                      priceRange: '${ticket.lowPrice} - ${ticket.highPrice}',
                      width: currentWidth,
                      height: 200,
                    );
                  },
                ),
              ),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: CustomPaginationBar(
                  totalPages: controller.totalPages.value,
                  currentPage: controller.currentPage.value,
                  // selectedColor: AppColors.purple,
                  // unselectedColor: AppColors.grey2,
                  onPageSelected: (page) => controller.fetchTickets(page: page),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
