import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget boxRow(
    {double? width,
    required String labelBox,
    bool? useBorder = false,
    bool textAligncenter = false,
    Color? color,
    FontWeight? fontWeight,
    Alignment alignment = Alignment.bottomCenter}) {
  return Container(
    alignment: alignment,
    width: width,
    padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
    child: Text(
      labelBox,
      style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: 17.sp,
        color: color ?? Colors.black,
      ),
      textAlign: textAligncenter == true ? TextAlign.center : TextAlign.left,
    ),
  );
}
