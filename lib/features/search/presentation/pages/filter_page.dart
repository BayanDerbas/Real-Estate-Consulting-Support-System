import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/features/search/presentation/controllers/filter_controller.dart';
import 'package:graduation_project/features/search/presentation/widgets/base_search_screen.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FilterController controller = Get.put(FilterController());
    final width = MediaQuery.of(context).size.width;

    return BaseSearchScreen(
      appBarTitle: 'Filter',
      widget: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'سعر الدقيقة',
              style: const TextStyle(fontSize: 20),
              textDirection: TextDirection.ltr,
            ),
            const SizedBox(height: 16),
            Obx(
              () => Column(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: AppColors.purple,
                      inactiveTrackColor: Colors.grey.shade300,
                      thumbColor: AppColors.purple,
                      trackHeight: 4.0,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 10,
                      ),
                      overlayColor: AppColors.purple.withAlpha(32),
                      rangeValueIndicatorShape:
                          const PaddleRangeSliderValueIndicatorShape(),
                      showValueIndicator: ShowValueIndicator.always,
                    ),
                    child: RangeSlider(
                      values: controller.sliderValue.value,
                      min: 0.0,
                      max: 100.0,
                      divisions: 4,
                      labels: RangeLabels(
                        controller.sliderValue.value.start.round().toString(),
                        controller.sliderValue.value.end.round().toString(),
                      ),
                      onChanged: (value) {
                        controller.updateSliderValue(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
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
          ],
        ),
      ),
    );
  }
}
