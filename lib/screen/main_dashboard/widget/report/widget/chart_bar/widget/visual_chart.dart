import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
import 'package:provider/provider.dart';

import '../../../../../../../models/departement.dart';

class VisualChart extends StatefulWidget {
  const VisualChart({Key? key, required this.data, required this.timeLine})
      : super(key: key);

  final List<Departement> data;
  final List<Map<String, dynamic>> timeLine;

  @override
  State<VisualChart> createState() => _VisualChartState();
}

class _VisualChartState extends State<VisualChart> {
  double tinggiChart = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<ReportController>(context, listen: false);
    final theme = Theme.of(context);

    return Consumer<ReportController>(
      builder: (context, value, child) => Container(
        alignment: Alignment.bottomCenter,
        height: 500.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(widget.timeLine.length, (index) {
                var date =
                    DateFormat("dd/MM/yyyy").format(value.listDate[index]);
                List<Map<String, dynamic>> data = widget.timeLine[index][date];
                var dateInString = widget.timeLine[index].keys.toString();
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        event
                            .hoverOnStickChart(
                                padding: 20.sp,
                                index: index,
                                selectedDate: value.listDate[index])
                            .whenComplete(() => event.displayDailyDetailData(
                                context: context,
                                listDept: widget.data,
                                generalData:
                                    Provider.of<MainDashboardController>(
                                            context,
                                            listen: false)
                                        .data!));
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(
                            bottom: index == value.indexHovered
                                ? value.paddingOnHover
                                : 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.r),
                                topRight: Radius.circular(10.r)),
                            boxShadow: value.indexHovered == index
                                ? [
                                    BoxShadow(
                                        color: mainColor2.withOpacity(0.5),
                                        spreadRadius: 2.sp,
                                        blurRadius: 2.sp)
                                  ]
                                : null),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: List.generate(data.length, (i) {
                              int heightData = data[i]["total"];
                              int color = int.parse(data[i]["color"]);

                              return Tooltip(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    color: mainColor2),
                                preferBelow: false,
                                margin: const EdgeInsets.all(0),
                                richMessage: TextSpan(
                                    children: List.generate(
                                        data.length,
                                        (index) => TextSpan(
                                            text:
                                                "${data[index]["group"]} : ${data[index]["total"]}\n"))),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(0),
                                      height: event.radiusOfBar(
                                          heightData, i, data.length - 1),
                                      width: 15.w,
                                      decoration: BoxDecoration(
                                          color: i == 0
                                              ? Color(color)
                                              : Color(color),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.r),
                                              topRight: Radius.circular(10.r))),
                                    ),
                                    AnimatedContainer(
                                      decoration: BoxDecoration(
                                        color: Color(color),
                                      ),
                                      // margin: EdgeInsets.only(left: 15.sp),
                                      duration:
                                          const Duration(milliseconds: 350),
                                      width: 15.w,
                                      height: heightData.h,
                                    ),
                                  ],
                                ),
                              );
                            })),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 25.w,
                      // height: 80.h,
                      child: Text(
                        dateInString.substring(1, 3),
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: theme.canvasColor),
                      ),
                    )
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
