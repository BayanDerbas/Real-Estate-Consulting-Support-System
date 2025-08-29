import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/features/ticket/data/model/ticket_model.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/get_all_tickets_controller.dart';
import 'package:graduation_project/features/ticket/presentation/widgets/my_ticket_card.dart';
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

    return _buildTicketsList(context);
  }

  Widget _buildTicketsList(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Obx(
      () => RefreshIndicator(
        color: AppColors.purple,
        onRefresh: () async {
          controller.filter();
        },
        child: ListView.separated(
          controller: controller.scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemCount: controller.length + (controller.last.isFalse ? 1 : 0),
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            if (controller.last.isFalse && index == controller.length) {
              if (controller.isLoading.value) {
                return const CircularProgressIndicator().center();
              }
              return const SizedBox();
            }
            final Ticket ticket = controller.tickets[index];
            final user = ticket.client;

            return MyTicketCard(
              id: ticket.id,
              fullName:
                  '${user.firstName ?? ""} ${user.lastName ?? ""}'
                          .trim()
                          .isEmpty
                      ? "غير معروف".tr
                      : '${user.firstName ?? ""} ${user.lastName ?? ""}',
              location: ticket.location,
              description: ticket.description,
              priceRange: '${ticket.lowPrice} - ${ticket.highPrice}',
              width: currentWidth,
              height: 300,
              model: ticket,
            );
          },
        ),
      ),
    );
  }
}
