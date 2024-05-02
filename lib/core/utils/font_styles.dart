import 'package:flutter/material.dart';
import 'package:islami_c10_str/core/providers/my_provider.dart';
import 'package:provider/provider.dart';

getTitleStyle(
  context, {
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  var theme = Provider.of<MyProvider>(context).themeMode;
  return TextStyle(
    fontSize: fontSize ?? 18,
    color: color ?? (theme == ThemeMode.light ? Colors.black : Colors.white),
    fontWeight: fontWeight ?? FontWeight.bold,
  );
}

getBodyStyle(
  context, {
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  var theme = Provider.of<MyProvider>(context).themeMode;
  return TextStyle(
    fontSize: fontSize ?? 16,
    color: color ?? (theme == ThemeMode.light ? Colors.black : Colors.white),
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

getSmallStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: fontSize ?? 14,
    color: color ?? Colors.grey,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}
