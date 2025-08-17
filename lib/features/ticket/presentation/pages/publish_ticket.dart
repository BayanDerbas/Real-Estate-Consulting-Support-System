import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
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
    'HOME',
    'UPPER_FLOOR',
    'VILLA',
    'OFFICE',
    'LAND',
    'STORE',
    'OTHER',
  ];

  final List<String> serviceTypeList = ['BUY', 'RENT', 'INVEST'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("create_ticket".tr, style: Fonts.itim),
        centerTitle: true,
        backgroundColor: AppColors.deepNavy,
      ),
      body: Stack(
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.skyBlue,
                    AppColors.lightBulishGray,
                    AppColors.softPink2,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'description'.tr,
                      icon: Icons.description,
                      width: double.infinity,
                      controller: controller.description,
                      maxLines: 3,
                      validator:
                          (val) =>
                              val == null || val.isEmpty ? 'required'.tr : null,
                    ),
                    CustomDropDownWithField(
                      list: houseTypeList,
                      item: controller.houseType,
                      onChanged:
                          (val) => controller.houseType.value = val ?? '',
                    ),
                    CustomDropDownWithField(
                      list: serviceTypeList,
                      item: controller.serviceType,
                      onChanged:
                          (val) => controller.serviceType.value = val ?? '',
                    ),
                    CustomTextField(
                      hintText: 'location'.tr,
                      icon: Icons.location_on,
                      width: double.infinity,
                      controller: controller.location,
                      validator:
                          (val) =>
                              val == null || val.isEmpty ? 'required'.tr : null,
                    ),
                    CustomTextField(
                      hintText: 'direction'.tr,
                      icon: Icons.explore,
                      width: double.infinity,
                      controller: controller.direction,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'low_price'.tr,
                            icon: Icons.price_change,
                            width: double.infinity,
                            keyboardType: TextInputType.number,
                            controller: controller.lowPrice,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextField(
                            hintText: 'high_price'.tr,
                            icon: Icons.price_check,
                            width: double.infinity,
                            keyboardType: TextInputType.number,
                            controller: controller.highPrice,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'area'.tr + ' (m²)',
                            icon: Icons.square_foot,
                            width: double.infinity,
                            keyboardType: TextInputType.number,
                            controller: controller.area,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: CustomTextField(
                            hintText: 'bathrooms'.tr,
                            width: double.infinity,
                            keyboardType: TextInputType.number,
                            controller: controller.numberOfBathrooms,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'beds'.tr,
                            width: double.infinity,
                            keyboardType: TextInputType.number,
                            controller: controller.numberOfBed,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextField(
                            hintText: 'rooms'.tr,
                            width: double.infinity,
                            keyboardType: TextInputType.number,
                            controller: controller.numberOfRooms,
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
                                text: 'submit_ticket'.tr,
                                backgroundColor: AppColors.deepNavy,
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
        ],
      ),
    );
  }
}
