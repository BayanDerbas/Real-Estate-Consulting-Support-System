import 'package:flutter/cupertino.dart';

import 'colors.dart';

List<BoxShadow> customBoxShadow({
  required double x,
  required double y,
  required double blurRadius,
  required double spreadRadius,
  Color? color,
}) {
  return [
    BoxShadow(
      color: color ?? AppColors.lightGrey,
      offset: Offset(x, y),
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    ),
  ];
}

TextStyle setTextStyle(
  TextStyle Function({
    double fontSize,
    Color color,
    FontWeight fontWeight,
    double letterSpacing,
  })
  fontFunction,
  double fontSize,
  Color color,
  FontWeight fontWeight,
) {
  return fontFunction(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    letterSpacing: 1.2,
  );
}
