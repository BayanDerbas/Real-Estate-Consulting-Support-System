import 'package:flutter/material.dart';

class CustomRangeSlider extends StatelessWidget {
  final RangeValues values;
  final double min;
  final double max;
  final int? divisions;
  final ValueChanged<RangeValues> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;

  const CustomRangeSlider({
    super.key,
    required this.values,
    required this.min,
    required this.max,
    this.divisions,
    required this.onChanged,
    this.activeColor = Colors.purple,
    this.inactiveColor = const Color(0xFFE0E0E0),
    this.thumbColor = Colors.purple,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: activeColor,
        inactiveTrackColor: inactiveColor,
        thumbColor: thumbColor,
        trackHeight: 2.0,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
        overlayColor: activeColor.withAlpha(32),
        rangeValueIndicatorShape: const PaddleRangeSliderValueIndicatorShape(),
        showValueIndicator: ShowValueIndicator.always,
      ),
      child: RangeSlider(
        values: values,
        min: min,
        max: max,
        divisions: divisions,
        labels: RangeLabels(
          values.start.round().toString(),
          values.end.round().toString(),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
