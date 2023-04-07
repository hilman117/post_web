import 'dart:math';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:post_web/reusable_widget/custom_calendar/custom_calendar.dart';

import '../../../../models/departement.dart';
import '../../../../models/task.dart';
import '../../../../reusable_widget/custom_calendar/widget/build_years.dart';
import 'widget/filter/widget/floating_menu/floating_menu.dart';

class ReportController with ChangeNotifier {
  int _departmentIndexReport = -1;
  int get departmentIndexReport => _departmentIndexReport;
  final CarouselController controllerCalendar = CarouselController();
  slideToNext() {
    controllerCalendar.nextPage();
    notifyListeners();
  }

  slideToPrevious() {
    controllerCalendar.previousPage();
    notifyListeners();
  }

  departmenReportSelected(int selectedDepartment) {
    _departmentIndexReport = selectedDepartment;
    // ignore: avoid_print
    print(_departmentIndexReport);
    notifyListeners();
  }

  List<String> percent = ["99", "100", "88", "97", "95", "90", "100"];
  List<String> totalOfRequest = [
    "33.009",
    "21.836",
    "22.324",
    "39.749",
    "2.090",
    "32.127",
    "1.292"
  ];

  List<String> dailyTimeLine = [
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 29))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 28))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 27))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 26))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 25))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 24))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 23))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 22))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 21))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 20))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 19))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 18))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 17))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 16))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 15))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 14))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 13))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 12))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 11))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 10))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 9))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 8))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 7))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 6))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 5))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 4))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 3))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 2))),
    DateFormat("dd").format(DateTime.now().subtract(const Duration(days: 1))),
    DateFormat("dd").format(DateTime.now()),
  ];

  List<String> hourlyTimeLine = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
  ];

  bool _isOverlayShow = false;
  bool get isOverlayShow => _isOverlayShow;
  OverlayState? overlay;
  OverlayEntry? entry;
  final layerlink = LayerLink();
  showFitlerOvrelay(BuildContext context, bool newBool) {
    if (!_isOverlayShow) {
      _isOverlayShow = newBool;
      final size = MediaQuery.of(context).size;
      overlay = Overlay.of(context);
      entry = OverlayEntry(
        builder: (context) => Positioned(
            right: size.width * 0.2,
            top: size.height * 0.4,
            child: CompositedTransformFollower(
                link: layerlink,
                offset: Offset(size.width * 0.04, size.height * 0.05),
                showWhenUnlinked: false,
                followerAnchor: Alignment.topCenter,
                child: const Center(child: FloatingMenuWidget()))),
      );
      overlay?.insert(entry!);
      notifyListeners();
    }
  }

  hideFlotingFilter() {
    if (_isOverlayShow) {
      _isOverlayShow = false;
      entry!.remove();
      entry = null;
      notifyListeners();
    }
  }

  //overlay that called for showing calendar
  OverlayState? overlayCalendar;
  OverlayEntry? entryCalendar;
  showCaledar({required BuildContext context, TaskModel? taskModel}) {
    if (entry == null) {
      overlay = Overlay.of(context);
      entry = OverlayEntry(
        builder: (context) => Positioned(
            top: 400.h,
            right: 50.w,
            child: customCalendar(context, getYears())),
      );
      overlay?.insert(entry!);
      notifyListeners();
    }
  }

//to hide overlay of calndar
  hideCalendar() {
    if (entryCalendar != null) {
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          entryCalendar!.remove();
          entryCalendar = null;
          // isProfileShow = false;
          notifyListeners();
        },
      );
    }
  }

  //overlay that called for showing year
  //to get start year and end of calendar year
  int selectedYear = 0;
  selectYear(int year) {
    hideYear();
    selectedYear = year;
    notifyListeners();
  }

  List<DateTime> getYears() {
    DateTime startYear = DateTime.now();
    Duration endYear = DateTime(startYear.year + 6).difference(startYear);
    int differenceInYears = (endYear.inDays / 365).floor();
    return List<DateTime>.generate(
        differenceInYears, (i) => DateTime(startYear.year + i));
  }

  OverlayState? overlayYear;
  OverlayEntry? entryYear;
  showYear({required BuildContext context, TaskModel? taskModel}) {
    if (entryYear == null) {
      overlayYear = Overlay.of(context);
      entryYear = OverlayEntry(
        builder: (context) => Positioned(
            top: 350.h,
            right: 125.w,
            child: buildListYears(context, getYears())),
      );
      overlayYear?.insert(entryYear!);
      notifyListeners();
    }
  }

//to hide overlay of calndar
  hideYear() {
    if (entryYear != null) {
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          entryYear!.remove();
          entryYear = null;
          // isProfileShow = false;
          notifyListeners();
        },
      );
    }
  }

  int totalRequest = 0;
  getRandomTotal() {
    totalRequest = (1 + Random().nextInt(100));
    notifyListeners();
  }

  List<String> status = ["Accepted", "Close", "Assigned", "Hold", "Pause"];

  bool _isClick = false;
  bool get isClick => _isClick;
  clickButton() {
    _isClick = true;
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        _isClick = false;
        notifyListeners();
      },
    );
    notifyListeners();
  }

  DateTimeRange dateTimeRange = DateTimeRange(
      start: DateTime.now().subtract(const Duration(days: 7)),
      end: DateTime.now());

  Future rangeDatePicker(BuildContext context) async {
    DateTimeRange? newRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime(2021),
        lastDate: DateTime(2023 + 5),
        currentDate: dateTimeRange.start,
        initialDateRange: dateTimeRange);
    if (newRange == null) return;

    dateTimeRange = newRange;
    notifyListeners();
    // print(dateTimeRange.start.day + 1);
    // print(dateTimeRange.duration.inDays);
    // print(dateTimeRange.start.month);
  }

  List<int> weeklyDate = [
    DateTime.now().subtract(const Duration(days: 6)).day,
    DateTime.now().subtract(const Duration(days: 5)).day,
    DateTime.now().subtract(const Duration(days: 4)).day,
    DateTime.now().subtract(const Duration(days: 3)).day,
    DateTime.now().subtract(const Duration(days: 2)).day,
    DateTime.now().subtract(const Duration(days: 1)).day,
    DateTime.now().day,
  ];

  List<int> day = [];
  List<int> indexWeeklyDay() {
    for (var element in weeklyDate) {
      day.add(element);
      // notifyListeners();
      // print(day);
    }
    return day;
  }

  // get result report for most widely title
  List listTitleOnDepartement = [];
  List<String> listRequestTitle = [];
  Set<String> testResult = {};
  bool lenghtTitle = false;
  int totalAllTitle = 0;
  int totalTitleInsertToResult = 0;
  List<Map<String, dynamic>> result = [];
  getMostWidelyTitle(
      List<TaskModel> requestList, List<Departement> departementList) {
    for (var element in requestList) {
      listRequestTitle.add(element.title!);
      testResult.add(element.title!);
      notifyListeners();
    }
    for (var element in departementList) {
      totalAllTitle = totalAllTitle + element.title!.length;
      listTitleOnDepartement.addAll(element.title!);
      if (totalAllTitle == listTitleOnDepartement.length) {
        lenghtTitle = true;
        notifyListeners();
      }
    }
  }

  getResultMostWidelyTitle(
      List<TaskModel> requestList, List<Departement> departementList) async {
    await getMostWidelyTitle(requestList, departementList);
    if (listRequestTitle.length == requestList.length && lenghtTitle == true) {
      for (var titleFromDept in listTitleOnDepartement) {
        var hasil =
            listRequestTitle.where((title) => title == titleFromDept).toList();
        if (hasil.isNotEmpty) {
          result.add({"title": hasil.first, "total": hasil.length.toString()});
        }
      }
    }
    print(testResult.length);
    print(result.length);
    print(result[0]);
    print(result[1]);
    print(result[2]);
    print(result[3]);
    print(result[4]);
    print(result[5]);
    print(result[6]);
    print(result[7]);
    print(result[8]);
    print(result[9]);
    print(result[10]);
    print(result[11]);
    print(result[12]);
    print(result[13]);
    print(result[14]);
    print(result[15]);
    print(result[16]);
    print(result[17]);
    print(result[18]);
    print(result[19]);
    print(result[20]);
    print(result[21]);
    print(result[22]);
    print(result[23]);
    print(result[24]);
    print(result[25]);
    print(testResult.length);
  }
}
