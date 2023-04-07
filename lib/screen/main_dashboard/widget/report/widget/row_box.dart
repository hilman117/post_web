import 'package:flutter/material.dart';

Widget rowBox(
    {required BoxConstraints p1,
    double? fonsize,
    FontWeight? fontWeight,
    double? height,
    required ThemeData theme,
    required String value,
    Alignment? alignment,
    Color? color}) {
  return Container(
    alignment: alignment ?? Alignment.centerLeft,
    height: height ?? p1.maxHeight * 0.075,
    width: p1.maxWidth * 0.15,
    child: Text(
      value,
      style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color ?? Colors.black,
          fontSize: fonsize ?? p1.maxWidth * 0.03),
      textAlign: TextAlign.center,
    ),
  );
}
