import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:graduation_project/features/search/presentation/widgets/my_ticket_card.dart';
import '../../../../core/constants/fake_data_not_for_use.dart';
import '../controllers/my_tickets_controller.dart';

class MyTickets extends StatelessWidget {
  MyTickets({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final MyTicketsController controller = Get.find<MyTicketsController>();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        itemCount: fakeTickets.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: width / (height * 0.6),
        ),
        itemBuilder: (context, index) {
          final ticket = fakeTickets[index];
          return MyTicketCard(
            height: height * 0.3,
            width: width * 0.5,
            name: ticket['name'],
            num: ticket['num'],
            location: ticket['location'],
            domain: ticket['domain'],
            budget: ticket['budget'],
          );
        },
      ),
    );
  }
}
