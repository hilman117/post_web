import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../const.dart';
import '../../../screen/main_dashboard/widget/report/controller_report.dart';

Widget headerOfCalendar(BuildContext context, List<DateTime> listTimeRange) {
  final event = Provider.of<ReportController>(context, listen: false);
  final value = context.watch<ReportController>();
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July" "August",
    "September",
    "October",
    "November",
    "December"
  ];

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: () => event.slideToNext(),
        child: Icon(Icons.arrow_back_ios_new_rounded,
            size: 25.sp, color: mainColor2
            // const Color(0xffE8EEF8) color for inactive button
            ),
      ),
      Row(
        children: [
          SizedBox(
              width: 120.w,
              height: 20.h,
              child: CarouselSlider(
                  carouselController: value.controllerCalendar,
                  items: List.generate(
                    months.length,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.sp),
                      child: Text(
                        months[index],
                        style: TextStyle(
                            color: mainColor2,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    // scrollPhysics: const NeverScrollableScrollPhysics(),
                    viewportFraction: 1,
                    // aspectRatio: 1000 / 1000,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  ))),
          SizedBox(
            width: 5.w,
          ),
          FittedBox(
            child: Container(
              padding: EdgeInsets.all(3.sp),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3.r),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0.0, 0.0),
                        color: Colors.grey,
                        spreadRadius: 0.5.sp,
                        blurRadius: 0.5.sp)
                  ]),
              child: InkWell(
                onTap: () => event.showYear(context: context),
                child: Row(
                  children: [
                    Text(
                      value.selectedYear == 0
                          ? DateFormat("yyyy").format(DateTime.now())
                          : value.selectedYear.toString(),
                      style: TextStyle(
                          color: mainColor2,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Icon(
                      Icons.arrow_drop_down_rounded,
                      color: mainColor2,
                      size: 18.sp,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      InkWell(
        onTap: () => event.slideToPrevious(),
        child:
            Icon(Icons.arrow_forward_ios_rounded, size: 25.sp, color: mainColor2
                //  const Color(0xffE8EEF8) color for inactive button
                ),
      ),
    ],
  );
}
