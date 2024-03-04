import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
import 'package:provider/provider.dart';

import '../../../../../const.dart';
import '../../../../../models/task.dart';
import '../../dashboard/widget/row_title/widget/status_widget.dart';
import 'box_row.dart';

Widget historyRequest(BuildContext context) {
  final event = Provider.of<ReportController>(context, listen: false);
  final theme = Theme.of(context);
  const brightness = Brightness.dark;
  return Column(
    children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 5.sp),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 1.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Histori Request",
                    style: TextStyle(fontSize: 24.sp, color: theme.canvasColor),
                  ),
                  Consumer<ReportController>(builder: (context, value, child) {
                    return InkWell(
                        onTap: () => event.exportToExcel(),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: const Color(0xffE8EEF8)),
                          padding: EdgeInsets.all(5.sp),
                          child: Icon(
                            Icons.print_rounded,
                            color: const Color(0xff3100F9),
                            size: 30.sp,
                          ),
                        ));
                  })
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                SizedBox(
                  child: Icon(
                    Icons.more_vert_rounded,
                    color: mainColor2,
                    size: 30.sp,
                  ),
                ),
                boxRow(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff8E99C0),
                  labelBox: "Dibuat pada".toUpperCase(),
                  width: 140.w,
                ),
                boxRow(
                  alignment: Alignment.centerLeft,
                  fontWeight: FontWeight.w600,
                  labelBox: "Lokasi".toUpperCase(),
                  width: 230.w,
                  color: const Color(0xff8E99C0),
                ),
                boxRow(
                  alignment: Alignment.centerLeft,
                  fontWeight: FontWeight.w600,
                  labelBox: "Title".toUpperCase(),
                  width: 230.w,
                  color: const Color(0xff8E99C0),
                ),
                boxRow(
                  alignment: Alignment.centerLeft,
                  fontWeight: FontWeight.w600,
                  labelBox: "Description".toUpperCase(),
                  width: 250.w,
                  color: const Color(0xff8E99C0),
                ),
                boxRow(
                  textAligncenter: true,
                  fontWeight: FontWeight.w600,
                  labelBox: "Tanggal tutup".toUpperCase(),
                  width: 140.w,
                  color: const Color(0xff8E99C0),
                ),
                boxRow(
                  fontWeight: FontWeight.w600,
                  textAligncenter: true,
                  labelBox: "Waktu Penyelesaian".toUpperCase(),
                  width: 110.w,
                  color: const Color(0xff8E99C0),
                ),
                boxRow(
                  fontWeight: FontWeight.w600,
                  labelBox: "Pembuat".toUpperCase(),
                  width: 200.w,
                  color: const Color(0xff8E99C0),
                ),
                boxRow(
                  fontWeight: FontWeight.w600,
                  labelBox: "Penerima".toUpperCase(),
                  width: 200.w,
                  color: const Color(0xff8E99C0),
                ),
                boxRow(
                  fontWeight: FontWeight.w600,
                  labelBox: "Status Akhir".toUpperCase(),
                  width: 155.w,
                  color: const Color(0xff8E99C0),
                ),
                boxRow(
                  fontWeight: FontWeight.w600,
                  labelBox: "Request ID".toUpperCase(),
                  width: 175.w,
                  color: const Color(0xff8E99C0),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Consumer<ReportController>(builder: (context, value, child) {
        return Container(
          height: 700.h,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: ListView.builder(
            itemCount: value
                .getDataWithDept()
                .where((element) => element.status == "Close")
                .length,
            itemBuilder: (context, index) {
              value.getDataWithDept().sort(
                    (a, b) => b.time!.compareTo(a.time!),
                  );
              TaskModel task = value
                  .getDataWithDept()
                  .where((element) => element.status == "Close")
                  .elementAt(index);

              return Consumer<MainDashboardController>(
                  builder: (context, value, child) => Container(
                        // height: 60.h,
                        decoration: BoxDecoration(
                            color: ganjilGenap(index)
                                ? colorBaseOnTheme(theme, brightness)
                                : theme.cardColor,
                            border: Border(
                                left: BorderSide(
                                    color: value.isDarkMode
                                        ? const Color(0xff8E99C0)
                                        : Colors.grey.shade300,
                                    width: 1.w),
                                right: BorderSide(
                                    color: value.isDarkMode
                                        ? const Color(0xff8E99C0)
                                        : Colors.grey.shade300,
                                    width: 1.w),
                                top: BorderSide(
                                    color: value.isDarkMode
                                        ? const Color(0xff8E99C0)
                                        : Colors.grey.shade300,
                                    width: 1.w),
                                bottom: BorderSide(
                                    color: value.isDarkMode
                                        ? const Color(0xff8E99C0)
                                        : Colors.grey.shade300,
                                    width: 1.w))),
                        child: Row(
                          children: [
                            SizedBox(
                              child: Image.asset(
                                task.iconDepartement!,
                                height: 30.h,
                                width: 30.w,
                              ),
                            ),
                            boxRow(
                                color: theme.canvasColor,
                                labelBox: DateFormat("dd-MM-yy, hh:mm a")
                                    .format(task.time!.toLocal()),
                                width: 140.w,
                                useBorder: true),
                            boxRow(
                                alignment: Alignment.centerLeft,
                                color: theme.canvasColor,
                                labelBox: task.location!,
                                width: 230.w,
                                useBorder: true),
                            boxRow(
                                color: theme.canvasColor,
                                alignment: Alignment.centerLeft,
                                labelBox: task.title!,
                                width: 230.w,
                                useBorder: true),
                            boxRow(
                                color: theme.canvasColor,
                                alignment: task.description != ""
                                    ? Alignment.centerLeft
                                    : Alignment.center,
                                labelBox: task.description != ""
                                    ? task.description!
                                    : "-",
                                width: 250.w,
                                useBorder: true),
                            boxRow(
                                color: theme.canvasColor,
                                labelBox: DateFormat("dd-MM-yy, hh:mm a")
                                    .format(task.time!.toLocal()),
                                width: 140.w,
                                useBorder: true),
                            boxRow(
                                color: theme.canvasColor,
                                labelBox: task.resolusi!,
                                width: 110.w,
                                useBorder: true),
                            boxRow(
                                color: theme.canvasColor,
                                labelBox: task.sender!,
                                width: 200.w,
                                useBorder: true),
                            boxRow(
                                color: theme.canvasColor,
                                labelBox: task.receiver!,
                                width: 200.w,
                                useBorder: true),
                            SizedBox(
                              width: 155.w,
                              child: statusWidget(
                                  context: context, status: task.status!),
                            ),
                            boxRow(
                                color: theme.canvasColor,
                                labelBox: task.id!,
                                width: 175.w,
                                useBorder: true),
                          ],
                        ),
                      ));
            },
          ),
        );
      })
    ],
  );
}

bool ganjilGenap(int index) {
  if (index % 2 == 0) {
    return true;
  }
  return false;
}

Color colorBaseOnTheme(ThemeData theme, Brightness brightness) {
  if (brightness == Brightness.dark) {
    return theme.scaffoldBackgroundColor;
  }
  return Colors.grey.shade100;
}
