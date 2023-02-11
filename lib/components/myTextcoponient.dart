import 'package:flutter/material.dart';

CostumTextStyle({Color? color, FontWeight? fontWeight, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 14,
    fontWeight: fontWeight ?? FontWeight.w600,
    color: color ?? Colors.white,
  );
}
