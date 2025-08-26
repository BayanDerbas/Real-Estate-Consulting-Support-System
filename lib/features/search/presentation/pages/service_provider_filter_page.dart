// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:graduation_project/core/constants/colors.dart';
// import 'package:graduation_project/core/constants/styles.dart';
// import 'package:graduation_project/core/extensions/widget_extension.dart';
// import 'package:graduation_project/core/widgets/custom_check_box.dart';
// import 'package:graduation_project/features/search/presentation/controllers/service_provider_filter_controller.dart';
// import 'package:graduation_project/features/search/presentation/widgets/base_search_screen.dart';
//
// import '../../../../core/widgets/Custom_Button.dart';
// import '../widgets/custom_range_slider.dart';
//
// class ServiceProviderFilter extends StatelessWidget {
//   const ServiceProviderFilter({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final ServiceProviderFilterController controller = Get.put(
//       ServiceProviderFilterController(),
//     );
//     final width = MediaQuery.of(context).size.width;
//
//     return BaseSearchScreen(
//       appBarTitle: 'Filter',
//       widget: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             const Text(
//               'سعر الدقيقة',
//               style: TextStyle(fontSize: 20),
//               textDirection: TextDirection.ltr,
//             ),
//             const SizedBox(height: 10),
//             Obx(
//               () => Container(
//                 decoration: BoxDecoration(
//                   color: AppColors.pureWhite,
//                   boxShadow: customBoxShadow(
//                     x: 6,
//                     y: 7,
//                     blurRadius: 6,
//                     spreadRadius: 5,
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     CustomRangeSlider(
//                       values: controller.minutePrice.value,
//                       min: 0.0,
//                       max: 100.0,
//                       divisions: 4,
//                       onChanged: (value) => controller.updateMinute(value),
//                       activeColor: AppColors.purple,
//                       inactiveColor: AppColors.pureWhite,
//                       thumbColor: AppColors.purple,
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 4.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('0'),
//                           Text('25'),
//                           Text('50'),
//                           Text('75'),
//                           Text('100'),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//             Obx(
//               () => Container(
//                 width: width * 0.8,
//                 decoration: BoxDecoration(
//                   color: AppColors.pureWhite,
//                   boxShadow: customBoxShadow(
//                     x: 6,
//                     y: 7,
//                     blurRadius: 6,
//                     spreadRadius: 5,
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     const Text(
//                       'اختصاص الخبير',
//                       style: TextStyle(fontSize: 20),
//                       textDirection: TextDirection.ltr,
//                     ),
//                     const SizedBox(height: 16),
//
//                     GridView.count(
//                       crossAxisCount: 4,
//                       crossAxisSpacing: 6,
//                       mainAxisSpacing: 6,
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       children:
//                           controller.filters.map((filter) {
//                             final bool isSelected = controller.isSelected(
//                               filter,
//                             );
//
//                             return Padding(
//                               padding: const EdgeInsets.all(5),
//                               child: CustomButton(
//                                 onPressed: () {
//                                   controller.selectFilter(filter);
//                                   print(controller.selectedFilters);
//                                 },
//                                 text: filter,
//                                 backgroundColor:
//                                     isSelected
//                                         ? AppColors.purple
//                                         : AppColors.filterButtonWhite,
//                                 textColor:
//                                     isSelected
//                                         ? AppColors.pureWhite
//                                         : AppColors.black,
//                                 width: 100,
//                                 borderRadius: 13,
//                               ),
//                             );
//                           }).toList(),
//                     ).paddingAll(15),
//                   ],
//                 ),
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 const Text(
//                   'سنوات الخبرة',
//                   style: TextStyle(fontSize: 20),
//                   textDirection: TextDirection.ltr,
//                 ),
//                 const SizedBox(height: 16),
//                 Obx(
//                   () => CustomRangeSlider(
//                     values: controller.experienceYears.value,
//                     min: 0.0,
//                     max: 40.0,
//                     divisions: 4,
//                     onChanged:
//                         (value) => controller.updateExperienceYears(value),
//                     activeColor: AppColors.purple,
//                     inactiveColor: AppColors.pureWhite,
//                     thumbColor: AppColors.purple,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 4.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('0'),
//                       Text('10'),
//                       Text('20'),
//                       Text('30'),
//                       Text('40'),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Obx(
//               () => CustomCheckbox(
//                 label: 'المتاحين فقط',
//                 value: controller.onlyAvailable.value,
//                 onChanged: (value) {
//                   controller.onChangeOnlyAvailable();
//                 },
//               ),
//             ),
//             CustomButton(
//               text: 'تصفية',
//               backgroundColor: AppColors.deepNavy,
//               textColor: AppColors.pureWhite,
//               width: width * 0.9,
//             ),
//           ],
//         ).scrollDirection(Axis.vertical),
//       ),
//     );
//   }
// }
