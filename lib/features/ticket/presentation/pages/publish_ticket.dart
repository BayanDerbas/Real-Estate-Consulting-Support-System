import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/features/ticket/data/repository/ticket_repository.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../Auth/presentation/widgets/custom_drop_down_with_field.dart';
import '../../../Auth/presentation/widgets/custom_text_form_field.dart';
import '../controllers/create_ticket_controller.dart';

class CreateTicketScreen extends StatelessWidget {
  CreateTicketScreen({super.key});

  final CreateTicketController controller = Get.find<CreateTicketController>();

  final List<String> houseTypeList = [
    'UPPER_FLOOR',
    'LOWER_FLOOR',
    'DUPLEX',
    'STUDIO',
  ];

  final List<String> serviceTypeList = ['BUY', 'RENT', 'INVEST'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.lavender,
      appBar: AppBar(
        title: Text("Create Ticket", style: Fonts.itim),
        centerTitle: true,
        backgroundColor: AppColors.purple,
      ),

      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomTextField(
                  hintText: 'Description',
                  icon: Icons.description,
                  width: double.infinity,
                  controller: controller.description,
                  maxLines: 3,
                  validator:
                      (val) => val == null || val.isEmpty ? 'Required' : null,
                ),
                CustomDropDownWithField(
                  list: houseTypeList,
                  item: controller.houseType,
                  onChanged: (val) => controller.houseType.value = val ?? '',
                ),
                CustomDropDownWithField(
                  list: serviceTypeList,
                  item: controller.serviceType,
                  onChanged: (val) => controller.serviceType.value = val ?? '',
                ),
                CustomTextField(
                  hintText: 'Location',
                  icon: Icons.location_on,
                  width: double.infinity,
                  controller: controller.location,
                  validator:
                      (val) => val == null || val.isEmpty ? 'Required' : null,
                ),
                CustomTextField(
                  hintText: 'Direction',
                  icon: Icons.explore,
                  width: double.infinity,
                  controller: controller.direction,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hintText: 'Low Price',
                        icon: Icons.price_change,
                        width: double.infinity,
                        keyboardType: TextInputType.number,
                        controller: controller.lowPrice,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                        hintText: 'High Price',
                        icon: Icons.price_check,
                        width: double.infinity,
                        keyboardType: TextInputType.number,
                        controller: controller.highPrice,
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  hintText: 'Area (m²)',
                  icon: Icons.square_foot,
                  width: double.infinity,
                  keyboardType: TextInputType.number,
                  controller: controller.area,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hintText: 'Beds',
                        //  icon: Icons.bed,
                        width: double.infinity,
                        keyboardType: TextInputType.number,
                        controller: controller.numberOfBed,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                        hintText: 'Rooms',
                        //  icon: Icons.room_preferences,
                        width: double.infinity,
                        keyboardType: TextInputType.number,
                        controller: controller.numberOfRooms,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                        hintText: 'Bathrooms',
                        // icon: Icons.bathroom,
                        width: double.infinity,
                        keyboardType: TextInputType.number,
                        controller: controller.numberOfBathrooms,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Obx(
                  () =>
                      controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : CustomButton(
                            text: 'submit ticket',
                            backgroundColor: AppColors.purple,
                            textColor: AppColors.pureWhite,
                            width: width * 0.6,
                            onPressed: () {
                              controller.submitTicket();
                              print(controller.clientId);
                            },
                          ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
