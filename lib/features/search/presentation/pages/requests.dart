import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/fake_data_not_for_use.dart';
import 'package:graduation_project/features/search/presentation/widgets/base_search_screen.dart';
import 'package:graduation_project/features/search/presentation/widgets/custom_request_card.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BaseSearchScreen(
      appBarTitle: 'help requests',
      widget: ListView.builder(
        itemCount: fakePropertyRequests.length,

        itemBuilder: (ctx, index) {
          final request = fakePropertyRequests[index];
          return CustomRequestCard(
            title: request['title'] ?? '',
            description: request['subtitle'] ?? '',
            imagePath: request['url'],
            width: width * 0.8,
            height: height * 0.25,
          ).paddingSymmetric(vertical: 10, horizontal: 10);
        },
      ),
    );
  }
}
