// ignore_for_file: avoid_print

import 'dart:math';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:post_web/models/general_data.dart';
import 'package:post_web/models/popular_model.dart';
import 'package:post_web/reusable_widget/show_dialog.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../firebase/firebase_get_task_data.dart';
import '../../../../models/departement.dart';
import '../../../../models/task.dart';
import '../../../../models/user.dart';

class ReportController with ChangeNotifier {
  String selectedDept = '';
  //to filter close task with specific departement
  // List<TaskModel> closeList = [];
  List<TaskModel> masterDataTask = [];
  GeneralData? hotelData;
  Future<void> getMasterDataTask(
      {required BuildContext context,
      required List<Departement> listDept,
      required GeneralData generalData}) async {
    ShowDialog().loadingDataReport(context);
    await FirebaseGetTaskData().getAllTask().then((value) async {
      masterDataTask = value;
      hotelData = generalData;

      await hourlyChartData(listDept);
      await dailyChartData(listDept);
      await getPopularTitle(listDept);
      await getResultMostWidelyTitle(listDept);
      // ignore: use_build_context_synchronously
      await getTopReceiver(context);
      await getPopularLocation(generalData);
      // ignore: use_build_context_synchronously
      await getMost10CreatorRequest(context);
      await getDataForChartBar(listDept);
      // ignore: use_build_context_synchronously
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    // ignore: use_build_context_synchronously
    notifyListeners();
  }

//method untuk mereload data setelah pemilihan filter
  Future reloadDataFilter(
      {required BuildContext context,
      required List<Departement> listDept,
      required GeneralData generalData}) async {
    ShowDialog().loadingDataReport(context);
    // getDataWithDept();
    await getPopularTitle(listDept);
    await hourlyChartData(listDept);
    await dailyChartData(listDept);
    await getResultMostWidelyTitle(listDept);
    // ignore: use_build_context_synchronously
    await getTopReceiver(context);
    await getPopularLocation(generalData);
    // ignore: use_build_context_synchronously
    await getMost10CreatorRequest(context);
    await getDataForChartBar(listDept);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    notifyListeners();
  }

  Future displayDailyDetailData(
      {required BuildContext context,
      required List<Departement> listDept,
      required GeneralData generalData}) async {
    ShowDialog().loadingDataReport(context);
    // getDataWithDept();
    await getPopularTitle(listDept);
    await hourlyChartData(listDept);
    await getResultMostWidelyTitle(listDept);
    // ignore: use_build_context_synchronously
    await getTopReceiver(context);
    await getPopularLocation(generalData);
    // ignore: use_build_context_synchronously
    await getMost10CreatorRequest(context);
    await getDataForChartBar(listDept);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    notifyListeners();
  }

  List<TaskModel> getDataWithDept() {
    List<TaskModel> filteredData = masterDataTask.where((element) {
      String dateEnd = DateFormat("dd MMM yyyy").format(rangeEnd!);
      String dateElement = DateFormat("dd MMM yyyy").format(element.time!);
      if (onSelectedDay != null) {
        String sameDay = DateFormat("dd MMM yyyy").format(onSelectedDay!);
        //untuk memfilter data yg dihasilkan hari ini atau persatu hari
        return dateElement == sameDay;
      }

      //utk memfilter data yang difilter dengan range tgl yg dipilih
      return element.time!.isAfter(rangeStart!) &&
              element.time!.isBefore(rangeEnd!) ||
          dateEnd == dateElement;
    }).toList();

    if (selectedDept.isNotEmpty) {
      filteredData = filteredData
          .where((element) => element.sendTo == selectedDept)
          .toList();
    }

    if (selectedLocation.isNotEmpty) {
      filteredData = filteredData
          .where((element) => element.location == selectedLocation)
          .toList();
    }

    if (selectedUserName.isNotEmpty) {
      filteredData = filteredData
          .where((element) => element.sender == selectedUserName)
          .toList();
    }

    if (selectedTitle.isNotEmpty) {
      filteredData = filteredData
          .where((element) =>
              element.title?.toLowerCase() == selectedTitle.toLowerCase())
          .toList();
    }

    if (selectedUserName.isNotEmpty && selectedDept.isNotEmpty) {
      filteredData = filteredData
          .where((element) =>
              element.sender == selectedUserName &&
              element.sendTo == selectedDept)
          .toList();
    }

    if (selectedTitle.isNotEmpty && selectedDept.isNotEmpty) {
      filteredData = filteredData
          .where((element) =>
              element.title?.toLowerCase() == selectedTitle.toLowerCase() &&
              element.sendTo == selectedDept)
          .toList();
    }

    if (selectedLocation.isNotEmpty && selectedDept.isNotEmpty) {
      filteredData = filteredData
          .where((element) =>
              element.location == selectedLocation &&
              element.sendTo == selectedDept)
          .toList();
    }

    if (selectedLocation.isNotEmpty &&
        selectedDept.isNotEmpty &&
        selectedUserName.isNotEmpty &&
        selectedTitle.isNotEmpty) {
      filteredData = filteredData
          .where((element) =>
              element.location == selectedLocation &&
              element.sendTo == selectedDept &&
              element.sender == selectedUserName &&
              element.title?.toLowerCase() == selectedTitle.toLowerCase())
          .toList();
    }

    // Add more conditions if needed
    return filteredData;
  }

// method to select report with specific departement
  Departement? departement;
  departmenReportSelected(Departement selectedDepartment) {
    selectedDept = selectedDepartment.departement!;
    departement = selectedDepartment;
    debugPrint(selectedDept);
    notifyListeners();
  }

  OverlayPortalController controllerDept = OverlayPortalController();
  Future clearFilter(
      {bool? isDeptCleared,
      bool? isUserNameCleared,
      bool? isLocationCleared}) async {
    if (isDeptCleared == true) {
      Future.delayed(
          const Duration(milliseconds: 500), () => selectedDept = "");
    }
    if (isUserNameCleared == true) {
      Future.delayed(
          const Duration(milliseconds: 500), () => selectedUserName = "");
    }
    if (isLocationCleared == true) {
      Future.delayed(
          const Duration(milliseconds: 500), () => selectedLocation = "");
    }
    notifyListeners();
  }

  //
  bool getFocusApply = false;
  void getFocusNode({bool? applyFocus}) {
    getFocusApply = applyFocus ?? false;
    notifyListeners();
  }

  String selectedUserName = "";
  Future selectUserName(String selectedName) async {
    selectedUserName = selectedName;
    debugPrint(selectedUserName);
    notifyListeners();
  }

  String selectedTitle = "";
  Future selectTitle(String selectedTitle) async {
    selectedTitle = selectedTitle;
    debugPrint(selectedTitle);
    notifyListeners();
  }

  String selectedLocation = "";
  Future selectLocation(String location) async {
    selectedLocation = location;
    debugPrint(selectedLocation);

    notifyListeners();
  }

  //ALL ABOUT CALENDAR
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay = DateTime.now();
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime? rangeStart = DateTime.now().subtract(const Duration(days: 30));
  DateTime? rangeEnd = DateTime.now();
  DateTime? onSelectedDay;
  onDaySelected(DateTime day, DateTime today) {
    selectedDay = day;
    focusedDay = today;
    rangeSelectionMode = RangeSelectionMode.toggledOff;
    rangeStart = null;
    rangeEnd = null;
    notifyListeners();
  }

  void applyOnSelectedDay() {
    onSelectedDay = selectedDay;
    notifyListeners();
  }

  Future clearOnSelectedDay() async {
    onSelectedDay = null;
    notifyListeners();
  }

  onRangeSelected(DateTime today, DateTime? startRange, DateTime? endRange) {
    focusedDay = today;
    rangeStart = startRange;
    rangeEnd = endRange;
    selectedDay = endRange;
    // selectedDay = null;
    rangeSelectionMode = RangeSelectionMode.toggledOn;
    notifyListeners();

    // print(rangeEnd);
  }

  onFormatChanged(CalendarFormat format) {
    calendarFormat = format;
    notifyListeners();
  }

  onPageChanged(DateTime today) {
    focusedDay = today;
    notifyListeners();
  }

  // //METHOD UNTUK MENGAMBIL DATA DAILY CHART
  List<DateTime> listDate = [];

  List<DateTime> getPreviousMonthDates() {
    listDate.clear();
    // Mendapatkan tanggal saat ini
    DateTime currentDate = DateTime.now();

    // Mengurangi satu bulan dari tanggal saat ini
    DateTime previousMonth = currentDate.subtract(const Duration(days: 30));

    // Mengisi list dengan tanggal-tanggal
    while (previousMonth.isBefore(currentDate) ||
        previousMonth.isAtSameMomentAs(currentDate)) {
      listDate.add(previousMonth);
      previousMonth = previousMonth.add(const Duration(days: 1));
    }

    return listDate;
  }

  Map<String, List<TaskModel>> filteredDataMap = {};
  Map<String, List<TaskModel>> filteredData = {};
  List<Map<String, dynamic>> resultData = [];

  Future dailyChartData(List<Departement> deptList) async {
    if (listDate.isEmpty &&
        filteredDataMap.isEmpty &&
        resultData.isEmpty &&
        filteredData.isEmpty) {
      getPreviousMonthDates();
    } else {
      listDate.clear();
      filteredDataMap.clear();
      resultData.clear();
      filteredData.clear();
      DateTime? currentDate = rangeStart;
      while (currentDate!.isBefore(rangeEnd!) ||
          currentDate.isAtSameMomentAs(rangeEnd!)) {
        listDate.add(currentDate);
        currentDate = currentDate.add(const Duration(days: 1));
      }
    }

    for (DateTime tgl in listDate) {
      var dateString = DateFormat("dd/MM/yyyy").format(tgl);
      List<TaskModel> dataList = getDataWithDept().where((item) {
        var requestTime = DateFormat("dd/MM/yyyy").format(item.time!);
        return dateString == requestTime;
      }).toList();
      filteredData[dateString] = dataList;
    }

    // hitung jumlah grup pada setiap tanggal

    for (DateTime tgl in listDate) {
      var dateString = DateFormat("dd/MM/yyyy").format(tgl);
      List<Map<String, dynamic>> groupData = [];
      Map<String, int> countMap = {};
      if (filteredData[dateString] != null) {
        if (selectedDept.isNotEmpty) {
          for (TaskModel item in filteredData[dateString]!) {
            String group = item.title!;
            countMap[group] = (countMap[group] ?? 0) + 1;
          }
          for (var title in departement!.title!) {
            Color getRandomColor() {
              Random random = Random();
              return Color.fromARGB(
                255,
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
              );
            }

            Color myRandomColor = getRandomColor();
            countMap.forEach((key, value) {
              if (key == title) {
                groupData.add({
                  'group': key,
                  'total': value,
                  "color": "0x${myRandomColor.value.toRadixString(16)}"
                });
              }
            });
          }
        } else {
          for (TaskModel item in filteredData[dateString]!) {
            String group = item.sendTo!;
            countMap[group] = (countMap[group] ?? 0) + 1;
          }
          for (var dept in deptList) {
            countMap.forEach((key, value) {
              if (key == dept.departement) {
                groupData
                    .add({'group': key, 'total': value, "color": dept.color});
              }
            });
          }
        }
      }

      resultData.add({dateString: groupData});
    }
    print("................................................$resultData");
    notifyListeners();
  }

  List<DateTime> listHours = [];
  Map<String, List<TaskModel>> filteredHourlyMap = {};
  Map<String, List<TaskModel>> filteredHourlyData = {};
  List<Map<String, dynamic>> resultHourlyData = [];
  bool isProcessing = false;
  Future hourlyChartData(List<Departement> deptList) async {
    isProcessing = true;
    if (filteredHourlyMap.isEmpty &&
        resultHourlyData.isEmpty &&
        filteredHourlyData.isEmpty) {
    } else {
      filteredHourlyMap.clear();
      resultHourlyData.clear();
      filteredHourlyData.clear();
    }
    listHours = List.generate(24, (index) {
      var currentTime = onSelectedDay ?? selectedDay;
      return DateTime(currentTime!.year, currentTime.month, currentTime.day)
          .add(Duration(hours: index));
    });
    for (DateTime tgl in listHours) {
      var dateString =
          DateFormat("dd/MM/yyyy HH").format(tgl); // Perubahan di sini
      List<TaskModel> dataList = getDataWithDept().where((item) {
        var requestTime =
            DateFormat("dd/MM/yyyy HH").format(item.time!); // Perubahan di sini
        return dateString == requestTime;
      }).toList();
      filteredHourlyData[dateString] = dataList;
    }

    // hitung jumlah grup pada setiap jam

    for (DateTime tgl in listHours) {
      var dateString =
          DateFormat("dd/MM/yyyy HH").format(tgl); // Perubahan di sini
      List<Map<String, dynamic>> groupData = [];
      Map<String, int> countMap = {};
      if (filteredHourlyData[dateString] != null) {
        if (selectedDept.isNotEmpty) {
          for (TaskModel item in filteredHourlyData[dateString]!) {
            String group = item.title!;
            countMap[group] = (countMap[group] ?? 0) + 1;
          }
          for (var title in departement!.title!) {
            Color getRandomColor() {
              Random random = Random();
              return Color.fromARGB(
                255,
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
              );
            }

            Color myRandomColor = getRandomColor();
            countMap.forEach((key, value) {
              if (key == title) {
                groupData.add({
                  'group': key,
                  'total': value,
                  "color": "0x${myRandomColor.value.toRadixString(16)}"
                });
              }
            });
          }
        } else {
          for (TaskModel item in filteredHourlyData[dateString]!) {
            String group = item.sendTo!;
            countMap[group] = (countMap[group] ?? 0) + 1;
          }
          for (var dept in deptList) {
            countMap.forEach((key, value) {
              if (key == dept.departement) {
                groupData
                    .add({'group': key, 'total': value, "color": dept.color});
              }
            });
          }
        }
      }

      resultHourlyData.add({dateString: groupData});
    }
    isProcessing = false;

    notifyListeners();
  }

  //METHOD UNTUK ME-FILTER 10 USER TERBANYAK MEMBUAT REQUEST DLM 1 BULAN.
  List<Map<String, dynamic>> listTopCreator = [];
  Future<void> getMost10CreatorRequest(BuildContext context) async {
    var dataEmployees = Provider.of<List<UserDetails>>(context, listen: false);
    listTopCreator.clear();
    for (var employee in dataEmployees) {
      var resultData = getDataWithDept()
          .where((request) => request.sender == employee.name)
          .toList();
      if (resultData.isNotEmpty) {
        for (var taksmodel in resultData) {
          if (listTopCreator
              .every((element) => element['name'] != taksmodel.sender)) {
            listTopCreator
                .add({"name": taksmodel.sender, "total": resultData.length});
          }
        }
      }
    }
    notifyListeners();
  }

  // METHOD UNTUK ME-FILTER DATA TITLE YG PALING BANYAK DI REQUEST DLM 1 BULAN//
  List listTitleOnDepartement = [];
  List<Map<String, dynamic>> listRequestTitle = [];
  // Set<String> testResult = {};
  bool lenghtTitle = false;
  int totalAllTitle = 0;
  int totalTitleInsertToResult = 0;
  List<Map<String, dynamic>> result = [];
  getMostWidelyTitle(List<Departement> departementList) {
    for (var element in getDataWithDept()) {
      listRequestTitle.add({"title": element.title!, "time": element.time});
      // testResult.add(element.title!);
    }
    for (var element in departementList) {
      totalAllTitle = totalAllTitle + element.title!.length;
      listTitleOnDepartement.addAll(element.title!);
      if (totalAllTitle == listTitleOnDepartement.length) {
        lenghtTitle = true;
        notifyListeners();
      }
    }
    notifyListeners();
  }

  Future<void> getResultMostWidelyTitle(
      List<Departement> departementList) async {
    await getMostWidelyTitle(departementList);

    if (listRequestTitle.length == getDataWithDept().length &&
        lenghtTitle == true) {
      for (var titleFromDept in listTitleOnDepartement) {
        var hasil = listRequestTitle
            .where((singleTask) => singleTask["title"] == titleFromDept)
            .toList();
        if (hasil.isNotEmpty) {
          result.add(
              {"title": hasil[0]["title"], "total": hasil.length.toString()});
        }
      }
    }
    notifyListeners();
    debugPrint("ini hasil nyaaa $result .................................");
  }

  //method popular title
  List<PopularModel> dataPopularTitle = [];
  Map<String, int> titleCount = {};
  List<String> titleList = [];

  Future getPopularTitle(List<Departement> listDept) async {
    dataPopularTitle.clear();
    titleCount.clear();
    titleList.clear();

    await Future.delayed(
      const Duration(milliseconds: 500),
      () {
        for (var i = 0; i < listDept.length; i++) {
          var titleDept = listDept[i].title;
          if (titleDept!.isNotEmpty) {
            titleList.addAll(titleDept);
          }
        }
      },
    );

    // Use a Set to store unique titles
    Set<String> uniqueTitles = Set<String>.from(titleList);

    // loop through the requests to count the title occurrences

    for (String title in uniqueTitles) {
      int count = 0;
      int closedCount = 0;
      double donePercent = 0;
      String resTime = "";

      for (TaskModel req in getDataWithDept()) {
        if (req.title == title) {
          count++;

          if (req.status == 'Close') {
            closedCount++;
          }
        }
      }

      if (count > 0) {
        donePercent = (closedCount / count) * 100;
      }

      dataPopularTitle.add(PopularModel(
          itemName: title,
          total: count,
          closed: closedCount,
          ratePercent: "${donePercent.toStringAsFixed(0)}%",
          resolutionTime: resTime));
    }

    notifyListeners();
  }

  //method popular location
  List<PopularModel> dataPopularLocation = [];
  // create a Map to keep track of the location count
  // Map<String, int> locationCount = {};
  // List<String> titleList = [];

  Future getPopularLocation(GeneralData generatData) async {
    dataPopularLocation.clear();
    var locationList = generatData.location!;
    // loop through the requests to count the title occurrences
    var requestByDate = getDataWithDept();
    for (String location in locationList) {
      int count = 0;
      int closedCount = 0;
      double donePercent = 0;
      String resTime = "";

      for (TaskModel req in requestByDate) {
        if (req.location == location) {
          count++;

          if (req.status == 'Close') {
            closedCount++;
          }
        }
      }

      if (count > 0) {
        donePercent = (closedCount / count) * 100;
      }
      dataPopularLocation.add(PopularModel(
          itemName: location,
          total: count,
          closed: closedCount,
          ratePercent: "${donePercent.toStringAsFixed(0)}%",
          resolutionTime: resTime));
    }
    notifyListeners();
  }

  // method popular location
  List<PopularModel> dataTopReceiver = [];
  List<String> listName = [];

  Future<void> getTopReceiver(BuildContext context) async {
    var dataEmployees = Provider.of<List<UserDetails>>(context, listen: false);

    dataTopReceiver.clear();
    listName.clear();

    await Future.delayed(
      const Duration(milliseconds: 500),
      () {
        for (var i = 0; i < dataEmployees.length; i++) {
          listName.add(dataEmployees[i].name!);
        }
      },
    );

    // Convert listName to a set to remove duplicates
    Set<String> uniqueNames = listName.toSet();
    listName = uniqueNames.toList();

    for (String name in listName) {
      int count = 0;
      int closedCount = 0;
      double donePercent = 0;
      String resTime = "";

      for (TaskModel req in getDataWithDept()) {
        if (req.receiver == name) {
          count++;

          if (req.status == 'Close') {
            closedCount++;
          }
        }
      }

      if (count > 0) {
        donePercent = (closedCount / count) * 100;
      }

      dataTopReceiver.add(PopularModel(
        itemName: name,
        total: count,
        closed: closedCount,
        ratePercent: "${donePercent.toStringAsFixed(0)}%",
        resolutionTime: resTime,
      ));
    }
    notifyListeners();
  }

//untuk mengatur radius daripada stick dari chartbar
  double radiusOfBar(int height, int index, int total) {
    if (height > 0 && index == 0) {
      return 10.h;
    } else {
      return 0;
    }
  }

  //section untuk method chartbar

  List<Map<String, dynamic>> listDataChartbar = [];
  Set<String> uniqueDepartments = <String>{};
  Future<void> getDataForChartBar(List<Departement> listDept) async {
    // Gunakan Set untuk menyimpan departemen unik
    listDataChartbar.clear();
    uniqueDepartments.clear();
    List<TaskModel> list = getDataWithDept();
    for (var request in list) {
      if (selectedDept.isNotEmpty) {
        for (var title in departement!.title!) {
          if (request.title == title) {
            // Periksa apakah departemen sudah ada dalam Set
            if (!uniqueDepartments.contains(request.title)) {
              // Jika belum, tambahkan departemen ke Set
              uniqueDepartments.add(request.title!);

              // untuk mengambil data total request pada masing-masing departemen
              var total =
                  list.where((element) => element.title == title).toList();

              // menghitung persen dari total request
              var percent = (total.length / list.length) * 100;

              // memasukkan data ke dalam list map
              listDataChartbar.add({
                "dept": request.title,
                "total": total.length,
                "percent": "${percent.toInt().toString()}%"
              });
            }
          }
        }
      } else {
        for (var dept in listDept) {
          if (request.sendTo == dept.departement) {
            // Periksa apakah departemen sudah ada dalam Set
            if (!uniqueDepartments.contains(request.sendTo)) {
              // Jika belum, tambahkan departemen ke Set
              uniqueDepartments.add(request.sendTo!);

              // untuk mengambil data total request pada masing-masing departemen
              var total = list
                  .where((element) => element.sendTo == dept.departement)
                  .toList();

              // menghitung persen dari total request
              var percent = (total.length / list.length) * 100;

              // memasukkan data ke dalam list map
              listDataChartbar.add({
                "dept": request.sendTo,
                "total": total.length,
                "percent": "${percent.toInt().toString()}%"
              });
            }
          }
        }
      }
    }
    pieData();
    notifyListeners();
  }

  List<PieData> pieChartSource = [];
  List<PieData>? pieData() {
    pieChartSource.clear();
    List.generate(
        listDataChartbar.length,
        (index) => pieChartSource.add(PieData(
            listDataChartbar[index]["dept"],
            listDataChartbar[index]["total"],
            listDataChartbar[index]["percent"])));
    notifyListeners();
    return pieChartSource;
  }

//method to export report data to excel
  List<String> cellTitle = [
    "TGL DIBUAT",
    "LOKASI",
    "JUDUL",
    "DESKRIPSI",
    "TGL TUTUP",
    "WKT PENYELESAIAN",
    "PEMPBUAT",
    "PENERIMA",
    "STATUS AKHIR",
    "REQUEST ID",
  ];
  void exportToExcel() {
    String today = DateTime.now().toString();
    Excel excel = Excel.createExcel();
    excel.rename(excel.getDefaultSheet()!, "POST_REPORT_EXPORT_$today");
    Sheet sheet = excel["POST_REPORT_EXPORT_$today"];
    List<TaskModel> listExportData = getDataWithDept()
        .where((element) => element.status == "Close")
        .toList();
    for (var i = 0; i < cellTitle.length; i++) {
      if (i == 3) {
        sheet.setColumnWidth(3, 30);
      } else {
        sheet.setColumnWidth(i, 20);
      }
      var cell =
          sheet.cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0));
      cell.value = TextCellValue(cellTitle[i]);
      cell.cellStyle = CellStyle(bold: true);
      for (var idx = 0; idx < listExportData.length; idx++) {
        TaskModel task = listExportData[idx];
        List<String> taskTitle = [
          task.time!.toString(),
          task.location!,
          task.title!,
          task.description!,
          task.closeTime!,
          task.resolusi!,
          task.sender!,
          task.receiver!,
          task.status!,
          task.id!
        ];
        var cellTask = sheet.cell(
            CellIndex.indexByColumnRow(columnIndex: i, rowIndex: idx + 1));
        cellTask.value = TextCellValue(taskTitle[i]);
      }
    }

    excel.save(fileName: "POST_REPORT_EXPORT_$today.xlsx");
  }

  double paddingOnHover = 0.0;
  int indexHovered = -1;
  Future hoverOnStickChart(
      {double? padding, int? index, DateTime? selectedDate}) async {
    paddingOnHover = padding ?? 0;
    indexHovered = index ?? -1;
    onSelectedDay = selectedDate;
    notifyListeners();
  }
}

class PieData {
  PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}
