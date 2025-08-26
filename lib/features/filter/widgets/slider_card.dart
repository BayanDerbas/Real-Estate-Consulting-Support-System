import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/styles.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final RxBool check;

  final Rx<SfRangeValues> values;
  final double min;
  final double max;
  final int? divisions;
  final ValueChanged<SfRangeValues>? onChanged;

  const SliderCard({
    super.key,
    required this.values,
    required this.min,
    required this.max,
    this.divisions,
    required this.title,
    this.subtitle,
    this.onChanged,
    required this.check,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: customBoxShadow(
          x: 0,
          y: 4,
          blurRadius: 4,
          spreadRadius: 0,
          color: Colors.black.withOpacity(.25),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(title, style: GoogleFonts.itim(fontSize: 26)),
              if (subtitle != null)
                Text(
                  " ($subtitle)",
                  style: GoogleFonts.itim(
                    fontSize: 16,
                    color: Color(0xff8E8E8E),
                  ),
                ),
              Spacer(),
              Text(
                "تجاهل",
                style: GoogleFonts.itim(fontSize: 18),
              ).onTap(() => check(!check.value)),
              Obx(
                () => Checkbox(
                  activeColor: Color(0xffA772EB),
                  value: check.value,
                  onChanged: (value) => check(!check.value),
                ),
              ),
            ],
          ).paddingDirectional(EdgeInsetsDirectional.only(start: 16)),
          Obx(() => SizedBox(height: check.isFalse ? 40 : 0)),
          Obx(
            () => AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: check.isFalse ? 1 : 0,
              child:
                  check.isFalse
                      ? CustomRangeSlider(
                        values: values,
                        min: min,
                        max: max,
                        divisions: divisions,
                        onChanged: onChanged,
                      )
                      : SizedBox(),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class CustomRangeSlider extends StatelessWidget {
  final Rx<SfRangeValues> values;
  final double min;
  final double max;
  final int? divisions;
  final ValueChanged<SfRangeValues>? onChanged;
  const CustomRangeSlider({
    super.key,
    required this.values,
    required this.min,
    required this.max,
    this.divisions,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SfRangeSlider(
        min: min,
        max: max,
        values: values.value,
        showLabels: true,
        showTicks: true,
        enableTooltip: true,
        tooltipShape: const SfPaddleTooltipShape(),
        tooltipTextFormatterCallback:
            (actualValue, formattedText) => actualValue.round().toString(),
        shouldAlwaysShowTooltip: true,
        activeColor: Color(0xffA772EB),
        inactiveColor: const Color(0xFFE0E0E0),
        onChanged: onChanged,
      ),
    );
  }
}
