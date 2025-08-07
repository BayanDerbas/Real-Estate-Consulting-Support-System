import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/features/posts/presentation/widgets/base_post_screen.dart';
import 'package:graduation_project/features/properties/presentation/controllers/create_property_controller.dart';
import 'package:graduation_project/features/ticket/data/repository/ticket_repository.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../Auth/presentation/widgets/custom_drop_down_with_field.dart';
import '../../../Auth/presentation/widgets/custom_text_form_field.dart';

class CreatePropertyScreen extends StatelessWidget {
  CreatePropertyScreen({super.key});

  final CreatePropertyController controller =
      Get.find<CreatePropertyController>();

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
        title: Text("Create Property", style: Fonts.itim),
        centerTitle: true,
        backgroundColor: AppColors.deepNavy,
      ),
      body: BasePostScreen(
        heightOfAppBar: 0,
        child: Stack(
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
                        hintText: 'Description',
                        icon: Icons.description,
                        width: double.infinity,
                        controller: controller.description,
                        maxLines: 3,
                        validator:
                            (val) =>
                                val == null || val.isEmpty ? 'Required' : null,
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
                        hintText: 'Location',
                        icon: Icons.location_on,
                        width: double.infinity,
                        controller: controller.location,
                        validator:
                            (val) =>
                                val == null || val.isEmpty ? 'Required' : null,
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
                              hintText: 'Price',
                              icon: Icons.price_change,
                              width: double.infinity,
                              keyboardType: TextInputType.number,
                              controller: controller.price,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomTextField(
                              hintText: 'price in month',
                              icon: Icons.price_check,
                              width: double.infinity,
                              keyboardType: TextInputType.number,
                              controller: controller.priceInMonth,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hintText: 'Area (m²)',
                              icon: Icons.square_foot,
                              width: double.infinity,
                              keyboardType: TextInputType.number,
                              controller: controller.area,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: CustomTextField(
                              hintText: 'Bathrooms',
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
                              hintText: 'Beds',
                              width: double.infinity,
                              keyboardType: TextInputType.number,
                              controller: controller.numberOfBed,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomTextField(
                              hintText: 'Rooms',
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
                                  text: 'Submit Property',
                                  backgroundColor: AppColors.deepNavy,
                                  textColor: AppColors.pureWhite,
                                  width: width * 0.6,
                                  onPressed: () {
                                    controller.submitProperty();
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
      ),
    );
  }
}
