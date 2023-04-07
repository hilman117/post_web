import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget boxBarWidget({
  required Color colors,
  required String deptName,
  required int totalRequest,
  required int value,
  required int index,
}) {
  return Tooltip(
    preferBelow: false,
    margin: const EdgeInsets.all(0),
    message: "$deptName : $value",
    child: AnimatedContainer(
      decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(index == 0 ? 10.r : 0.r),
              topRight: Radius.circular(index == 0 ? 10.r : 0.r))),
      // margin: EdgeInsets.only(left: 15.sp),
      duration: const Duration(milliseconds: 350),
      width: 15.w,
      height: totalRequest.h / 2.h,
    ),
  );
}
