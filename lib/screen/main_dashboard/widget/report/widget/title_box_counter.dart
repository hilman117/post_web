import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'row_box.dart';

Widget titleBoxCounter(
    {required BuildContext context,
    required String boxLabel,
    required String label,
    required String item,
    required int lengthData,
    IconData? iconData,
    required List data}) {
  final theme = Theme.of(context);
  return Container(
      height: 500.h,
      width: 400.w,
      margin: EdgeInsets.all(10.sp),
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: LayoutBuilder(
        builder: (ctx, p1) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: p1.maxHeight * 0.06,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      boxLabel,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: theme.canvasColor,
                          fontSize: 20.sp),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: const Color(0xffE8EEF8)),
                  padding: EdgeInsets.all(5.sp),
                  child: Icon(
                    iconData ?? Icons.bar_chart,
                    color: const Color(0xff3100F9),
                    size: 30.sp,
                  ),
                )
              ],
            ),
            SizedBox(
              height: p1.maxHeight * 0.03,
            ),
            Container(
              alignment: Alignment.center,
              height: p1.maxHeight * 0.1,
              width: p1.maxWidth,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: const Color(0xff8E99C0), width: 1.sp))),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        label.toUpperCase(),
                        style: TextStyle(
                            // fontWeight: FontWeight.normal,
                            color: const Color(0xff8E99C0),
                            fontSize: 16.sp),
                      ),
                    ),
                  ),
                  rowBox(
                      color: const Color(0xff8E99C0),
                      p1: p1,
                      theme: theme,
                      value: "Jml".toUpperCase(),
                      fonsize: 16.sp,
                      fontWeight: FontWeight.bold)
                ],
              ),
            ),
            SizedBox(
              height: p1.maxHeight * 0.03,
            ),
            Expanded(
              child: SizedBox(
                width: p1.maxWidth,
                child: ListView.builder(
                    itemCount: lengthData,
                    itemBuilder: (context, index) {
                      data.sort((a, b) => b["total"].compareTo(a["total"]));
                      return Container(
                        alignment: Alignment.center,
                        height: p1.maxHeight * 0.085,
                        width: p1.maxWidth,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: p1.maxHeight * 0.075,
                                padding: EdgeInsets.symmetric(horizontal: 3.sp),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  data[index][item].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: theme.canvasColor,
                                      fontSize: 18.sp),
                                ),
                              ),
                            ),
                            rowBox(
                                fonsize: 18.sp,
                                p1: p1,
                                theme: theme,
                                value: data[index]["total"].toString())
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ));
}
