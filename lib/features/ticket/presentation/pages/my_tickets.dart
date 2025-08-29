import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/features/ticket/data/model/ticket_model.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/my_tickets_controller.dart';
import 'package:graduation_project/features/ticket/presentation/widgets/my_ticket_card.dart';

import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/Custom_PaginationBar.dart';

class MyTickets extends GetView<MyTicketsController> {
  const MyTickets({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () => controller.filter(),
          child: ListView.separated(
            controller: controller.scrollController,
            padding: const EdgeInsets.all(16),
            itemCount:
                controller.myTickets.length + (controller.last.isFalse ? 1 : 0),
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              if (controller.last.isFalse && index == controller.length) {
                if (controller.isLoading.value) {
                  return const CircularProgressIndicator().center();
                }
                return const SizedBox();
              }

              final Ticket ticket = controller.myTickets[index];
              final user = ticket.client;

              return MyTicketCard(
                id: ticket.id,
                fullName: '${user.firstName ?? ""} ${user.lastName ?? ""}',
                location: ticket.location,
                description: ticket.description,
                priceRange: '${ticket.lowPrice} - ${ticket.highPrice}',
                width: screenWidth,
                height: context.height / 3,
                withActions: true,
                model: ticket,
              );
            },
          ),
        ),
      ),
    );
  }
}
