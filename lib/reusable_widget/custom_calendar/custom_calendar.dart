import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/days_of_month.dart';
import 'widget/header_of_calendar.dart';

Widget customCalendar(BuildContext context, List<DateTime> timeRange) {
  return Material(
    borderRadius: BorderRadius.circular(15.r),
    color: Colors.transparent,
    child: Container(
      // height: 350.h,
      width: 350.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0.1, 0.1),
                color: Colors.grey,
                spreadRadius: 0.5.sp,
                blurRadius: 2.sp)
          ]),
      child: Padding(
        padding: EdgeInsets.all(5.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            headerOfCalendar(context, timeRange),
            SizedBox(
              height: 10.h,
            ),
            daysOfMonth(context)
          ],
        ),
      ),
    ),
  );
}
