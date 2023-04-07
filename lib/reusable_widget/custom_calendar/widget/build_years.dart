import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../screen/main_dashboard/widget/report/controller_report.dart';

//widget to display list of year
Widget buildListYears(BuildContext context, List<DateTime> years) {
  final event = Provider.of<ReportController>(context, listen: false);
  return Material(
    borderRadius: BorderRadius.circular(4.r),
    color: Colors.transparent,
    child: FittedBox(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0.1, 0.1),
                  color: Colors.grey,
                  spreadRadius: 0.5.sp,
                  blurRadius: 2.sp)
            ],
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Column(
            children: List.generate(
              years.length,
              (index) => InkWell(
                onTap: () => event.selectYear(years[index].year),
                child: Container(
                  margin: EdgeInsets.all(5.sp),
                  child: Text(
                    years[index].year.toString(),
                    style: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          )),
    ),
  );
}
