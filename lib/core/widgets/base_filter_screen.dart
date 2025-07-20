import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/styles.dart';
import 'package:graduation_project/core/widgets/custom_text_form_feild.dart';
import 'package:graduation_project/features/Auth/presentation/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/Custom_Appbar.dart';

class BaseFilteredScreen extends StatelessWidget {
  const BaseFilteredScreen({
    super.key,
    required this.bodyBuilder,
    required this.filterSheetBuilder,
    this.onFilterApply,
    this.appBarTitle,
    this.bodyText,
  });

  final String? appBarTitle;
  final String? bodyText;

  final Widget Function(BuildContext context) bodyBuilder;
  final Widget Function(BuildContext context, void Function() onApply)
  filterSheetBuilder;
  final VoidCallback? onFilterApply;

  @override
  Widget build(BuildContext context) {
    double? currentWidth = Get.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: CustomAppbar(
            text: appBarTitle ?? '',
            icon: Icons.filter_alt_outlined,
            iconColor: Colors.white,
            onPressed: () => _showFilterSheet(context),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              width: currentWidth * 0.95,
              label: 'search',
              icon: Icons.search,
              readOnly: true,
              keyboardType: TextInputType.text,
              onIconPressed: () => _showFilterSheet(context),
              onTap: () => _showFilterSheet(context),
            ),
            if (bodyText != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  bodyText!,
                  style: setTextStyle(
                    GoogleFonts.itim,
                    16,
                    AppColors.black,
                    FontWeight.normal,
                  ),
                ),
              ),
            Expanded(child: bodyBuilder(context)),
          ],
        ),
      ),
    );
  }

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: filterSheetBuilder(ctx, () {
            Navigator.pop(ctx);
            if (onFilterApply != null) onFilterApply!();
          }),
        );
      },
    );
  }
}
