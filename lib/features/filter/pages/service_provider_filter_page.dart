import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/features/filter/controllers/service_providers_filter_controller.dart';
import 'package:graduation_project/features/filter/controllers/ticket_filter_controller.dart';
import 'package:graduation_project/features/filter/widgets/chips_card.dart';
import 'package:graduation_project/features/filter/widgets/slider_card.dart';
import 'package:graduation_project/features/search/presentation/controllers/service_provider_filter_controller.dart';
import 'package:graduation_project/features/search/presentation/widgets/base_search_screen.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/get_all_tickets_controller.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/my_tickets_controller.dart';

import '../../../core/constants/colors.dart';
import '../../../core/widgets/Custom_Button.dart';
import '../../service provider/presentation/controllers/ServiceProvidersControllers.dart';
import '../../ticket/presentation/controllers/page_controller.dart';

class ServiceProviderFilterPage extends StatelessWidget {
  const ServiceProviderFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ServiceProvidersFilterController>();

    return BaseSearchScreen(
      appBarTitle: 'Filter',
      withIcon: false,
      widget: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon(Icons.filter_alt_rounded, size: 32),
                  Text("تصفيه", style: GoogleFonts.itim(fontSize: 26)),
                ],
              ).paddingSymmetric(horizontal: 16),
              SliderCard(
                values: controller.prices,
                min: 0.0,
                max: 1000.0,
                title: 'السعر',
                subtitle: "مليون",
                onChanged: controller.onChangedPrice,
                check: controller.ignorePrice,
              ),
              SizedBox(height: 16),
              SliderCard(
                values: controller.area,
                min: 0.0,
                max: 1000.0,
                title: 'المساحة',
                subtitle: "متر مربع",
                onChanged: controller.onChangedArea,
                check: controller.ignoreArea,
              ),
              SizedBox(height: 16),
              ChipsCard(
                title: 'نوع الخدمة',
                list: controller.propertyServices,
                selectedList: controller.selectedPropertyServices,
              ),
              SizedBox(height: 16),
              ChipsCard(
                title: 'نوع العقار',
                list: controller.propertyTypes,
                selectedList: controller.selectedPropertyTypes,
              ),
              SizedBox(height: 16),
              ChipsCard(
                title: 'اتجاه العقار',
                list: controller.propertyDirections,
                selectedList: controller.selectedPropertyDirections,
              ),
              SizedBox(height: 84),
            ],
          ).scrollDirection(Axis.vertical),
          CustomButton(
                text: "تصفية",
                backgroundColor: AppColors.deepNavy,
                textColor: AppColors.pureWhite,
                onPressed: () {
                  Get.back();

                  Get.find<ServiceProviders_Controller>().filter(
                    filterItems: controller.onFilter(),
                  );
                },
              )
              .paddingSymmetric(vertical: 16, horizontal: 8)
              .align(alignment: Alignment.bottomCenter),
        ],
      ),
    );
  }
}
