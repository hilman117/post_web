import 'package:flutter/material.dart';

import '../../../../models/departement.dart';
import '../../../../models/task.dart';
import '../../../../models/weekly_report_model.dart';
import 'widget/filter/widget/floating_menu/floating_menu.dart';

class ReportController with ChangeNotifier {
  int _departmentIndexReport = -1;
  int get departmentIndexReport => _departmentIndexReport;

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

  List<int> total = [];
  List<Departement> deptActive = [];
  List<int> today = [];
  List<int> substrack1 = [];
  List<int> substrack2 = [];
  List<int> substrack3 = [];
  List<int> substrack4 = [];
  List<int> substrack5 = [];
  List<int> substrack6 = [];
  // List<Departement> deptActive = [];
  List<int> weeklyreport(BuildContext context, List<Departement> departement,
      List<TaskModel> tasks) {
    if (deptActive.isNotEmpty) {
      // ShowDialog().loadingDialog(context);
    } else {
      for (var indexDept in departement) {
        if (indexDept.isActive == true) {
          deptActive.add(indexDept);
        }

        //substrack 6
        var result6 = tasks.where((task) =>
            task.sendTo == indexDept.departement &&
            task.time!.day ==
                DateTime.now().subtract(const Duration(days: 6)).day);
        if (result6.isNotEmpty) {
          substrack6.add(result6.length);
        }
        // print("this is result of substrack6 ${substrack6.length}");

        //substrack 5
        var result5 = tasks.where((task) =>
            task.sendTo == indexDept.departement &&
            task.time!.day ==
                DateTime.now().subtract(const Duration(days: 5)).day);
        if (result5.isNotEmpty) {
          substrack5.add(result5.length);
        }
        // print("this is result of substrack5 ${substrack5.length}");

        //substrack 4
        var result4 = tasks.where((task) =>
            task.sendTo == indexDept.departement &&
            task.time!.day ==
                DateTime.now().subtract(const Duration(days: 4)).day);
        if (result4.isNotEmpty) {
          substrack4.add(result4.length);
        }
        // print("this is result of substrack4 ${substrack4.length}");

        //substrack 3
        var result3 = tasks.where((task) =>
            task.sendTo == indexDept.departement &&
            task.time!.day ==
                DateTime.now().subtract(const Duration(days: 3)).day);
        if (result3.isNotEmpty) {
          substrack3.add(result3.length);
        }
        // print("this is result of substrack3 ${substrack3.length}");

        //substrack 2
        var result2 = tasks.where((task) =>
            task.sendTo == indexDept.departement &&
            task.time!.day ==
                DateTime.now().subtract(const Duration(days: 2)).day);
        if (result2.isNotEmpty) {
          substrack2.add(result2.length);
        }
        // print("this is result of substrack2 ${substrack2.length}");

        //substrack 1
        var result1 = tasks.where((task) =>
            task.sendTo == indexDept.departement &&
            task.time!.day ==
                DateTime.now().subtract(const Duration(days: 1)).day);
        if (result1.isNotEmpty) {
          substrack1.add(result1.length);
        }
        // print("this is result of substrack1 ${substrack1.length}");

        //substrack today
        var result = tasks.where((task) =>
            task.sendTo == indexDept.departement &&
            task.time!.day == DateTime.now().day);
        if (result.isNotEmpty) {
          today.add(result.length);
        }
        // print("this is result of substrack today ${today.length}");
      }
    }

    return total;
  }

  List<WeeklyReportModel> dataChartWeekly(int index) {
    final List<WeeklyReportModel> dataForChart = [
      WeeklyReportModel(
          date: DateTime.now().subtract(const Duration(days: 6)).day,
          totalRequest: 342,
          listDepartement: substrack6),
      WeeklyReportModel(
          date: DateTime.now().subtract(const Duration(days: 5)).day,
          totalRequest: 231,
          listDepartement: substrack5),
      WeeklyReportModel(
          date: DateTime.now().subtract(const Duration(days: 4)).day,
          totalRequest: 432,
          listDepartement: substrack4),
      WeeklyReportModel(
          date: DateTime.now().subtract(const Duration(days: 3)).day,
          totalRequest: 211,
          listDepartement: substrack3),
      WeeklyReportModel(
          date: DateTime.now().subtract(const Duration(days: 2)).day,
          totalRequest: 342),
      WeeklyReportModel(
          date: DateTime.now().subtract(const Duration(days: 1)).day,
          totalRequest: 121,
          listDepartement: substrack1),
      WeeklyReportModel(
          date: DateTime.now().day, totalRequest: 544, listDepartement: today),
    ];
    return dataForChart;
  }
}
