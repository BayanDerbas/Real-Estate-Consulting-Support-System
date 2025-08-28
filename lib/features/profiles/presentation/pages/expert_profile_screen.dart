import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controllers/expert_profile_controller.dart';

class ExpertProfileScreen extends StatelessWidget {
  final controller = Get.put(ExpertController(profileRepository: Get.find()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expert Profile")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }
        if (controller.expertProfile.value == null) {
          return Center(child: Text("No data"));
        }

        final expert = controller.expertProfile.value!.data;
        return ListView(
          padding: EdgeInsets.all(16),
          children: [
            Text(
              "${expert?.user?.firstName ?? ''} ${expert?.user?.lastName ?? ''}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("Profession: ${expert?.profession ?? 'N/A'}"),
            Text("Experience: ${expert?.experience ?? 'N/A'}"),
            Text("Rating: ${expert?.rating ?? 0}"),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.fetchExpertByRole(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
