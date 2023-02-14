// ignore: file_names
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
CostumTextStyle({Color? color, FontWeight? fontWeight, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 14,
    fontWeight: fontWeight ?? FontWeight.w600,
    color: color ?? Colors.white,
  );
}
