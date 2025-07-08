import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/features/ticket/data/model/ticket_model.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/get_all_tickets_controller.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/my_tickets_controller.dart';
import 'package:graduation_project/features/ticket/presentation/widgets/my_ticket_card.dart';

import '../../../../core/widgets/Custom_Button.dart';

class MyTickets extends StatelessWidget {
  const MyTickets({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyTicketsController>();
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
            Obx(() => buildPagination(controller)),
            const SizedBox(height: 12),
          ],
        );
      }),
    );
  }

  Widget buildPagination(MyTicketsController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          text: '<',
          onPressed:
              controller.currentPage.value > 0
                  ? () => controller.fetchTickets(
                    page: controller.currentPage.value - 1,
                  )
                  : null,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          width: 40,
          height: 40,
        ),
        const SizedBox(width: 8),
        ...List.generate(controller.totalPages.value, (index) {
          final isActive = controller.currentPage.value == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CustomButton(
              text: '${index + 1}',
              onPressed: () {
                controller.fetchTickets(page: index);
              },
              backgroundColor: isActive ? AppColors.deepNavy : Colors.white,
              textColor: isActive ? Colors.white : Colors.black,
              width: 40,
              height: 40,
            ),
          );
        }),
        const SizedBox(width: 8),
        CustomButton(
          text: '>',
          onPressed:
              controller.currentPage.value < controller.totalPages.value - 1
                  ? () => controller.fetchTickets(
                    page: controller.currentPage.value + 1,
                  )
                  : null,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          width: 40,
          height: 40,
        ),
      ],
    ).scrollDirection(Axis.horizontal);
  }
}
