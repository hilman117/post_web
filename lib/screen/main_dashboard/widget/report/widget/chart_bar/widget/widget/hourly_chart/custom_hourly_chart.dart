import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../models/departement.dart';
import 'visual_hourly.dart';

Widget customHourlyChartbar(
    {required BuildContext context,
    required String label,
    void Function()? onTap,
    String? timeRange,
    IconData? iconData,
    required List<Map<String, dynamic>> timeline}) {
  var data = Provider.of<List<Departement>>(context);
  final theme = Theme.of(context);
  return Consumer2<MainDashboardController, ReportController>(
      builder: (context, value, value2, child) => Container(
            margin: EdgeInsets.symmetric(horizontal: 10.sp),
            padding: EdgeInsets.all(10.sp),
            height: 600.h,
            decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(25.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          style: TextStyle(fontSize: 20.sp),
                        ),
                        Text(
                          timeRange!,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 18.sp),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: const Color(0xffE8EEF8)),
                      padding: EdgeInsets.all(5.sp),
                      child: Icon(
                        iconData,
                        color: const Color(0xff3100F9),
                        size: 30.sp,
                      ),
                    )
                  ],
                ),
                InkWell(
                    child: visualHourlyChart(
                        data: data, context: context, timeLine: timeline))
              ],
            ),
          ));
}
