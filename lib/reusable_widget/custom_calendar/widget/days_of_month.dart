//widget list date of month

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
import 'package:provider/provider.dart';

import '../../../style.dart';

Widget daysOfMonth(BuildContext context) {
  List<String> dayOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  var january = DateTime(2023, 01);
  var february = DateTime(2023, 02);
  var march = DateTime(2023, 03);
  var april = DateTime(2023, 04);
  var may = DateTime(2023, 05);
  var june = DateTime(2023, 06);
  var july = DateTime(2023, 07);
  var august = DateTime(2023, 08);
  var sept = DateTime(2023, 09);
  var oct = DateTime(2023, 10);
  var nov = DateTime(2023, 11);
  var dec = DateTime(2023, 12);

  // Getting the total number of days of the month
  var totalDaysJanuary = daysInMonth(january);
  var totalDaysFeb = daysInMonth(february);
  var totalDaysMarch = daysInMonth(march);
  var totalDaysApril = daysInMonth(april);
  var totalDaysMay = daysInMonth(may);
  var totalDaysJune = daysInMonth(june);
  var totalDaysJuly = daysInMonth(july);
  var totalDaysAugust = daysInMonth(august);
  var totalDaysSept = daysInMonth(sept);
  var totalDaysOct = daysInMonth(oct);
  var totalDaysNov = daysInMonth(nov);
  var totalDaysDec = daysInMonth(dec);

  // Stroing all the dates till the last date
  // since we have found the last date using generate
  var datesOfJan = List<int>.generate(totalDaysJanuary, (i) => i + 1);
  var dateOfFeb = List<int>.generate(totalDaysFeb, (i) => i + 1);
  var dateOfMarch = List<int>.generate(totalDaysMarch, (i) => i + 1);
  var dateOfApril = List<int>.generate(totalDaysApril, (i) => i + 1);
  var dateOfMay = List<int>.generate(totalDaysMay, (i) => i + 1);
  var dateOfJune = List<int>.generate(totalDaysJune, (i) => i + 1);
  var dateOfJuly = List<int>.generate(totalDaysJuly, (i) => i + 1);
  var dateOfAugust = List<int>.generate(totalDaysAugust, (i) => i + 1);
  var dateOfSept = List<int>.generate(totalDaysSept, (i) => i + 1);
  var dateOfOct = List<int>.generate(totalDaysOct, (i) => i + 1);
  var dateOfNov = List<int>.generate(totalDaysNov, (i) => i + 1);
  var dateOfDec = List<int>.generate(totalDaysDec, (i) => i + 1);
  List<List<int>> daysAllOfMonth = [
    datesOfJan,
    dateOfFeb,
    dateOfMarch,
    dateOfApril,
    dateOfMay,
    dateOfJune,
    dateOfJuly,
    dateOfAugust,
    dateOfSept,
    dateOfOct,
    dateOfNov,
    dateOfDec
  ];
  final value = context.watch<ReportController>();
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(dayOfWeek.length, (index) {
            // print(DateFormat('EEE').format(DateTime(index)));
            return Container(
              alignment: Alignment.center,
              width: 45.w,
              height: 18.h,
              child: Text(
                dayOfWeek[index],
                style:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 16.sp),
              ),
            );
          }),
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      SizedBox(
        height: 250.h,
        child: CarouselSlider(
            carouselController: value.controllerCalendar,
            items: List.generate(daysAllOfMonth.length, (index) {
              List<int> listDates = daysAllOfMonth[index];
              return Wrap(
                children: List.generate(listDates.length, (index) {
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5.sp),
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: inActiveColor, width: 0.5.w),
                            top: BorderSide(color: inActiveColor, width: 0.5.w),
                            left: BorderSide(
                                color: inActiveColor,
                                width: listDates.first == index ? 1.w : 0.5.w),
                            right: BorderSide(
                                color: inActiveColor,
                                width: listDates.last == index ? 0.5.w : 1.w))),
                    child: Text(
                      listDates[index].toString(),
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.normal),
                    ),
                  );
                }),
              );
            }),
            options: CarouselOptions(
              // scrollPhysics: const NeverScrollableScrollPhysics(),
              viewportFraction: 1,
              // aspectRatio: 1000 / 1000,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            )),
      )
    ],
  );
}

int daysInMonth(DateTime date) {
  var firstDayThisMonth = DateTime(date.year, date.month, date.day);
  var firstDayNextMonth = DateTime(firstDayThisMonth.year,
      firstDayThisMonth.month + 1, firstDayThisMonth.day);
  return firstDayNextMonth.difference(firstDayThisMonth).inDays;
}
