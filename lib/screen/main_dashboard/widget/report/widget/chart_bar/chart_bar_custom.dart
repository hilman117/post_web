import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/chart_bar/widget/visual_chart.dart';
import 'package:provider/provider.dart';
import '../../../../../../models/departement.dart';
import '../../controller_report.dart';

Widget customChartbar(
    {required BuildContext context,
    required String label,
    void Function()? onTap,
    String? timeRange,
    IconData? iconData,
    required List<String> timeline}) {
  final event = Provider.of<ReportController>(context, listen: false);
  var data = Provider.of<List<Departement>>(context);
  var today = DateFormat("MMM d, yy").format(DateTime.now());
  var oneMonthAgo = DateFormat("MMM d").format(DateTime.now().subtract(Duration(
      days:
          DateUtils.getDaysInMonth(DateTime.now().year, DateTime.now().month) -
              1)));
  return Expanded(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
      padding: EdgeInsets.all(10.sp),
      height: 600.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25.r)),
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
                    timeRange ?? "$oneMonthAgo - $today",
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 18.sp),
                  ),
                ],
              ),
              InkWell(
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: const Color(0xffE8EEF8)),
                  padding: EdgeInsets.all(5.sp),
                  child: Icon(
                    iconData ?? Icons.calendar_month_sharp,
                    color: const Color(0xff3100F9),
                    size: 30.sp,
                  ),
                ),
              )
            ],
          ),
          InkWell(
              onTap: () => event.getRandomTotal(),
              child:
                  visualChart(data: data, context: context, timeLine: timeline))
        ],
      ),
    ),
  );
}
