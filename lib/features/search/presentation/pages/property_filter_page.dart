import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/styles.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/features/Auth/presentation/widgets/custom_drop_down_with_field.dart';
import 'package:graduation_project/features/Auth/presentation/widgets/custom_text_form_field.dart';
import 'package:graduation_project/features/search/presentation/controllers/property_filter_controller.dart';
import 'package:graduation_project/features/search/presentation/controllers/service_provider_filter_controller.dart';
import 'package:graduation_project/features/search/presentation/widgets/base_search_screen.dart';

import '../../../../core/widgets/Custom_Button.dart';
import '../widgets/custom_range_slider.dart';

class PropertyFilterPage extends StatelessWidget {
  const PropertyFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PropertyFilterController controller = Get.put(
      PropertyFilterController(),
    );
    final width = MediaQuery.of(context).size.width;

    return BaseSearchScreen(
      appBarTitle: 'Filter',
      widget: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'سعر العقار',
              style: TextStyle(fontSize: 20),
              textDirection: TextDirection.ltr,
            ),
            const SizedBox(height: 16),
            Obx(
              () => Container(
                decoration: BoxDecoration(
                  color: AppColors.pureWhite,
                  boxShadow: customBoxShadow(
                    x: 6,
                    y: 7,
                    blurRadius: 6,
                    spreadRadius: 5,
                  ),
                ),
                child: Column(
                  children: [
                    CustomRangeSlider(
                      values: controller.propertyPrice.value,
                      min: 0.0,
                      max: 100.0,
                      divisions: 4,
                      onChanged:
                          (value) => controller.updatePropertyPrice(value),
                      activeColor: AppColors.purple,
                      inactiveColor: AppColors.pureWhite,
                      thumbColor: AppColors.purple,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('0'),
                          Text('25'),
                          Text('50'),
                          Text('75'),
                          Text('100'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Obx(
              () => Container(
                width: width * 0.8,
                decoration: BoxDecoration(
                  color: AppColors.pureWhite,
                  boxShadow: customBoxShadow(
                    x: 6,
                    y: 7,
                    blurRadius: 6,
                    spreadRadius: 5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'نوع العقار',
                      style: TextStyle(fontSize: 20),
                      textDirection: TextDirection.ltr,
                    ),
                    const SizedBox(height: 16),

                    Wrap(
                      textDirection: TextDirection.rtl,
                      spacing: 3,
                      children:
                          controller.filters.map((filter) {
                            final bool isSelected = controller.isSelected(
                              filter,
                            );

                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: CustomButton(
                                onPressed: () {
                                  controller.selectFilter(filter);
                                  print(controller.selectedFilters);
                                },
                                text: filter,
                                backgroundColor:
                                    isSelected
                                        ? AppColors.purple
                                        : AppColors.filterButtonWhite,
                                textColor:
                                    isSelected
                                        ? AppColors.pureWhite
                                        : AppColors.black,
                                height: 40,
                                width: 120,
                              ),
                            );
                          }).toList(),
                    ).paddingAll(15),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'الحجم',
                  style: TextStyle(fontSize: 20),
                  textDirection: TextDirection.ltr,
                ),
                const SizedBox(height: 16),
                Obx(
                  () => CustomRangeSlider(
                    values: controller.propertySize.value,
                    min: 0.0,
                    max: 40.0,
                    divisions: 4,
                    onChanged: (value) => controller.updatePropertySize(value),
                    activeColor: AppColors.purple,
                    inactiveColor: AppColors.pureWhite,
                    thumbColor: AppColors.purple,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('0'),
                      Text('10'),
                      Text('20'),
                      Text('30'),
                      Text('40'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomButton(
              text: 'تصفية',
              backgroundColor: AppColors.deepNavy,
              textColor: AppColors.pureWhite,
              width: width * 0.9,
            ),
          ],
        ).scrollDirection(Axis.vertical),
      ),
    );
  }
}
