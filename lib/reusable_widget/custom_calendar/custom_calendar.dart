import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/const.dart';
import 'package:post_web/models/departement.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

customCalendar(BuildContext context) {
  return showDialog(
    barrierColor: Colors.transparent,
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          alignment: Alignment.centerRight,
          insetPadding: EdgeInsets.only(right: 100.sp, bottom: 100.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: const MyCalendar());
    },
  );
}

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  @override
  Widget build(BuildContext context) {
    // final value = context.watch<ReportController>();
    final event = Provider.of<ReportController>(context, listen: false);
    final departementData = Provider.of<List<Departement>>(context);
    final theme = Theme.of(context);
    return Consumer2<ReportController, MainDashboardController>(
      builder: (context, value, value2, child) => FittedBox(
        child: Container(
          decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    offset: Offset(0.0, 0.5))
              ]),
          // height: 350,
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TableCalendar(
                rowHeight: 30.sp,
                headerStyle: const HeaderStyle(
                    // titleTextStyle: TextStyle(fontWeight: FontWeight.normal),
                    headerPadding: EdgeInsets.all(0),
                    formatButtonVisible: false,
                    titleCentered: true),
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(shape: BoxShape.rectangle),
                  outsideTextStyle: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.grey),
                  weekNumberTextStyle: TextStyle(fontWeight: FontWeight.normal),
                  weekendTextStyle: TextStyle(fontWeight: FontWeight.normal),
                  defaultTextStyle: TextStyle(fontWeight: FontWeight.normal),
                  cellMargin: EdgeInsets.all(0),
                  markerMargin: EdgeInsets.all(0),
                ),
                firstDay: DateTime(2021, 03, 28),
                lastDay: DateTime(DateTime.now().year + 5, 03, 28),
                focusedDay: value.focusedDay,
                selectedDayPredicate: (day) =>
                    isSameDay(value.selectedDay, day),
                rangeStartDay: value.rangeStart,
                rangeEndDay: value.rangeEnd,
                calendarFormat: value.calendarFormat,
                rangeSelectionMode: value.rangeSelectionMode,
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(value.selectedDay, selectedDay)) {
                    event.onDaySelected(selectedDay, focusedDay);
                  }
                },
                onRangeSelected: (start, end, focusedDay) {
                  event.onRangeSelected(focusedDay, start, end);
                },
                onFormatChanged: (format) {
                  if (value.calendarFormat != format) {
                    event.onFormatChanged(format);
                  }
                },
                onPageChanged: (focusedDay) {
                  value.focusedDay = focusedDay;
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 30.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade300),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "cancel",
                            style: GoogleFonts.mPlusRounded1c(
                                fontSize: 13, color: Colors.grey),
                          )),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    SizedBox(
                      height: 30.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor2),
                          onPressed: () async {
                            event.reloadDataFilter(
                                context: context,
                                listDept: departementData,
                                generalData: value2.data!);
                          },
                          child: Text(
                            "Apply",
                            style: GoogleFonts.mPlusRounded1c(
                                fontSize: 13, color: Colors.white),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
