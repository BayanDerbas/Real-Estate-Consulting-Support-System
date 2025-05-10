import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/features/Auth/presentation/widgets/custom_text_form_field.dart';
import 'package:graduation_project/features/search/presentation/widgets/base_search_screen.dart';
import 'package:graduation_project/features/search/presentation/widgets/custom_range_slider.dart';
import 'package:graduation_project/features/search/presentation/widgets/dotted_text_field.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../../../core/constants/styles.dart';
import '../controllers/tickets_controller.dart';
import '../widgets/custom_ticket_widget.dart';

class PublishTicket extends StatelessWidget {
  const PublishTicket({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    TicketsController controller = Get.put(TicketsController());
    return Scaffold(
      body: BaseSearchScreen(
        appBarTitle: 'publish tickets',
        widget: Column(
          children: [
            SizedBox(height: height * 0.1),
            TicketCard(
              width: width * 0.9,
              height: height,
              backgroundColor: AppColors.whiteCard,
              widget: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(
                              "محمد محمد ",
                              style: setTextStyle(
                                GoogleFonts.inder,
                                20,
                                AppColors.black,
                                FontWeight.bold,
                              ),
                            ),
                            Text(
                              "0991090852",
                              style: setTextStyle(
                                GoogleFonts.inder,
                                16,
                                AppColors.darkGray,
                                FontWeight.normal,
                              ),
                            ),
                            Text(
                              "درعا _ تسيل - الحي الأوسط ",
                              style: setTextStyle(
                                GoogleFonts.inder,
                                16,
                                AppColors.darkGray,
                                FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            AppImages.property2,
                            fit: BoxFit.fill,
                            height: 60,
                            width: 60,
                          ),
                        ),
                      ],
                    ),
                    DottedLine(
                      lineThickness: 4,
                      lineLength: width * 0.7,
                      dashColor: AppColors.darkGray,
                      dashLength: 2,
                      dashGapLength: 4,
                    ).paddingSymmetric(vertical: 10),
                    DottedTextField(
                      hintText: 'اكتب ما تربد هنا ..',
                      width: width,
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DottedTextField(
                          hintText: 'المجال',
                          icon: Icons.access_time,
                          width: width / 3,
                        ),
                        DottedTextField(
                          hintText: 'الميزانية',
                          width: width / 3,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('الوقت'),
                        Column(
                          children: [
                            Obx(
                              () => CustomRangeSlider(
                                values: controller.time.value,
                                min: 0.0,
                                max: 10.0,
                                divisions: 4,
                                onChanged:
                                    (value) => controller.updateTime(value),
                                activeColor: AppColors.purple,
                                inactiveColor: AppColors.pureWhite,
                                thumbColor: AppColors.purple,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ).marginAll(10).paddingAll(10),
              ),
            ),
            SizedBox(height: height * 0.1),
            CustomButton(
              borderRadius: 10,
              text: 'نشر',
              backgroundColor: AppColors.deepNavy,
              textColor: AppColors.pureWhite,
              width: width * 0.9,
            ),
          ],
        ),
      ),
    );
  }
}
