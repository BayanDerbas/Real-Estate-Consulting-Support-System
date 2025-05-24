import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/features/search/presentation/widgets/base_search_screen.dart';
import 'package:graduation_project/features/search/presentation/widgets/custom_search_text_field.dart';

import '../controllers/search_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final MainSearchController controller = Get.put(MainSearchController());
    return BaseSearchScreen(
      appBarTitle: 'Search',
      widget: Column(
        children: [
          CustomSearchTextField(height: 40, width: width * 0.9),
          Obx(
            () => Wrap(
              spacing: 10,
              children:
                  controller.filters.map((filter) {
                    final bool isSelected = controller.isSelected(filter);
                    return CustomButton(
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
                          isSelected ? AppColors.pureWhite : AppColors.black,
                      width: 100,
                    );
                  }).toList(),
            ),
          ).paddingAll(15),
        ],
      ),
    );
  }
}
