import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/models/popular_model.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/row_title/widget/search_box.dart';

import 'row_box.dart';

Widget popularBoxCounter(
    {required BuildContext context,
    required String labelBox,
    required String label,
    required List<PopularModel> data,
    IconData? iconData,
    bool? withSearchBox = false,
    double? width}) {
  final theme = Theme.of(context);
  return Expanded(
    child: Container(
        width: width,
        height: 500.h,
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
                      height: p1.maxHeight * 0.075,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        labelBox,
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
              if (withSearchBox == true)
                SizedBox(
                  height: 40.h,
                  width: p1.maxWidth,
                  child: const SearchBox(),
                ),
              if (withSearchBox == true)
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
                            width: 1.sp, color: const Color(0xff8E99C0)))),
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
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    rowBox(
                        alignment: Alignment.center,
                        color: const Color(0xff8E99C0),
                        p1: p1,
                        theme: theme,
                        value: "Jml".toUpperCase(),
                        fontWeight: FontWeight.bold,
                        fonsize: 16.sp),
                    rowBox(
                        alignment: Alignment.center,
                        color: const Color(0xff8E99C0),
                        p1: p1,
                        theme: theme,
                        value: "Ditutup".toUpperCase(),
                        fontWeight: FontWeight.bold,
                        fonsize: 16.sp),
                    rowBox(
                        alignment: Alignment.center,
                        color: const Color(0xff8E99C0),
                        p1: p1,
                        theme: theme,
                        value: "Waktu Resolusi".toUpperCase(),
                        fontWeight: FontWeight.bold,
                        fonsize: 16.sp),
                    rowBox(
                        alignment: Alignment.center,
                        color: const Color(0xff8E99C0),
                        p1: p1,
                        theme: theme,
                        value: "Rate Resolusi".toUpperCase(),
                        fontWeight: FontWeight.bold,
                        fonsize: 16.sp),
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
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        data.sort((a, b) => b.total!.compareTo(a.total!));
                        var item = data[index];
                        if (item.total == 0) {
                          return const SizedBox();
                        }
                        return Container(
                          alignment: Alignment.center,
                          height: p1.maxHeight * 0.085,
                          width: p1.maxWidth,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.sp),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    item.itemName!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: theme.canvasColor,
                                        fontSize: 18.sp),
                                  ),
                                ),
                              ),
                              rowBox(
                                  alignment: Alignment.center,
                                  fonsize: 18.sp,
                                  p1: p1,
                                  theme: theme,
                                  value: item.total!.toString()),
                              rowBox(
                                  alignment: Alignment.center,
                                  fonsize: 18.sp,
                                  p1: p1,
                                  theme: theme,
                                  value: item.closed.toString()),
                              rowBox(
                                  alignment: Alignment.center,
                                  fonsize: 18.sp,
                                  p1: p1,
                                  theme: theme,
                                  value: item.resolutionTime!),
                              rowBox(
                                  alignment: Alignment.center,
                                  fonsize: 18.sp,
                                  p1: p1,
                                  theme: theme,
                                  value: item.ratePercent!)
                            ],
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        )),
  );
}
