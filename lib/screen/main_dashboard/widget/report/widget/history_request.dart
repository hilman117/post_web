import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:post_web/models/departement.dart';
import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
import 'package:provider/provider.dart';

import '../../../../../const.dart';
import '../../../../../models/task.dart';
import '../../dashboard/widget/row_title/widget/status_widget.dart';
import 'box_row.dart';

Widget historyRequest(BuildContext context) {
  var requestData = Provider.of<List<TaskModel>>(context);
  var listDepartement = Provider.of<List<Departement>>(context);
  final event = Provider.of<ReportController>(context, listen: false);
  return Column(
    children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 5.sp),
        decoration: BoxDecoration(
          color: Colors.white,
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
                    style: TextStyle(fontSize: 24.sp, color: Colors.black),
                  ),
                  InkWell(
                      onTap: () async {
                        var listDeprt = listDepartement
                            .where((element) => element.isActive == true)
                            .toList();
                        event.getResultMostWidelyTitle(requestData, listDeprt);
                      },
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
                      ))
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
                  fontWeight: FontWeight.w600,
                  labelBox: "Lokasi".toUpperCase(),
                  width: 230.w,
                  color: const Color(0xff8E99C0),
                ),
                boxRow(
                  fontWeight: FontWeight.w600,
                  labelBox: "Title".toUpperCase(),
                  width: 230.w,
                  color: const Color(0xff8E99C0),
                ),
                boxRow(
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
                  labelBox: "Waktu Selesai".toUpperCase(),
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
      Container(
        height: 700.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: ListView.builder(
          itemCount: requestData.length,
          itemBuilder: (context, index) {
            TaskModel task = requestData[index];
            return Container(
              // height: 60.h,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.grey.shade200, width: 1.w),
                      bottom:
                          BorderSide(color: Colors.grey.shade200, width: 1.w))),
              child: Row(
                children: [
                  SizedBox(
                    child: Image.asset(
                      "image/${task.sendTo}.png",
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                  boxRow(
                      labelBox: DateFormat("dd-MM-yy, hh:mm a")
                          .format(task.time!.toLocal()),
                      width: 140.w,
                      useBorder: true),
                  boxRow(
                      labelBox: task.location!, width: 230.w, useBorder: true),
                  boxRow(
                      alignment: Alignment.centerLeft,
                      labelBox: task.title!,
                      width: 230.w,
                      useBorder: true),
                  boxRow(
                      alignment: task.description != ""
                          ? Alignment.centerLeft
                          : Alignment.center,
                      labelBox:
                          task.description != "" ? task.description! : "-",
                      width: 250.w,
                      useBorder: true),
                  boxRow(
                      labelBox: DateFormat("dd-MM-yy, hh:mm a")
                          .format(task.time!.toLocal()),
                      width: 140.w,
                      useBorder: true),
                  boxRow(labelBox: "-", width: 110.w, useBorder: true),
                  boxRow(labelBox: task.sender!, width: 200.w, useBorder: true),
                  boxRow(
                      labelBox: task.receiver!, width: 200.w, useBorder: true),
                  SizedBox(
                    width: 155.w,
                    child: statusWidget(context: context, status: task.status!),
                  ),
                  boxRow(labelBox: task.id!, width: 175.w, useBorder: true),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
