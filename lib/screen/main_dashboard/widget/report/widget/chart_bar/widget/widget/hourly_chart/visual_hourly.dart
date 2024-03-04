import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../models/departement.dart';

Widget visualHourlyChart({
  required List<Departement> data,
  required BuildContext context,
  required List<Map<String, dynamic>> timeLine,
}) {
  final event = Provider.of<ReportController>(context, listen: false);
  final theme = Theme.of(context);
  // final activeDepartement =
  //     data.where((element) => element.isActive == true).toList();
  return Consumer<ReportController>(
    builder: (context, value, child) => Container(
      alignment: Alignment.bottomCenter,
      height: 500.h,
      child: value.isProcessing == true
          ? const Center(
              child: Text("Memproses data..."),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(timeLine.length, (index) {
                    var date = DateFormat("dd/MM/yyyy HH")
                        .format(value.listHours[index]);
                    List<Map<String, dynamic>> data = timeLine[index][date];
                    var dateInString = value.listHours[index].hour;
                    return Column(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: List.generate(data.length, (i) {
                              int heightData = data[i]["total"];
                              int color = int.parse(data[i]["color"]);

                              return Tooltip(
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
                                      height: heightData.toDouble() * 2,
                                    ),
                                  ],
                                ),
                              );
                            })),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 25.w,
                          // height: 80.h,
                          child: Text(
                            dateInString.toString(),
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
