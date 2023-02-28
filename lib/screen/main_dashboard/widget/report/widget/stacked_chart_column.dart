import 'package:flutter/material.dart';
import 'package:post_web/style.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeeklyStackedCharhtColumn extends StatefulWidget {
  const WeeklyStackedCharhtColumn({Key? key}) : super(key: key);

  @override
  State<WeeklyStackedCharhtColumn> createState() =>
      _WeeklyStackedCharhtColumnState();
}

class _WeeklyStackedCharhtColumnState extends State<WeeklyStackedCharhtColumn> {
  late List<DataDepartement> _chartWeekly;
  late TooltipBehavior tooltip;

  @override
  void initState() {
    _chartWeekly = dataChartWeekly();
    tooltip = TooltipBehavior(enable: true, shouldAlwaysShow: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SfCartesianChart(
        palette: const [
          Color(0xff1D9B88),
          Color(0xff72CABD),
          Color(0xff34BFAA),
          Color(0xff23DFC3),
          Color(0xff85FBE9),
          Color(0xffDEFDF7),
        ],
        title: ChartTitle(
            text:
                "Weekly Chart, Total request that received by each of departement",
            textStyle: style11Normal,
            alignment: ChartAlignment.center),
        legend: Legend(
          isVisible: true,
          textStyle: style11Bold,
        ),
        tooltipBehavior: tooltip,
        series: <ChartSeries>[
          StackedColumnSeries<DataDepartement, int>(
              dataSource: _chartWeekly,
              xValueMapper: (DataDepartement data, _) => data.date,
              yValueMapper: (DataDepartement data, _) => data.houskeeping,
              markerSettings: const MarkerSettings(
                  isVisible: true, image: AssetImage("image/Housekeeping.png")),
              name: "Housekeeping"),
          StackedColumnSeries<DataDepartement, int>(
              dataSource: _chartWeekly,
              xValueMapper: (DataDepartement data, _) => data.date,
              yValueMapper: (DataDepartement data, _) => data.frontOffice,
              markerSettings: const MarkerSettings(
                  isVisible: true, image: AssetImage("image/Front Office.png")),
              name: "Front Office"),
          StackedColumnSeries<DataDepartement, int>(
              dataSource: _chartWeekly,
              xValueMapper: (DataDepartement data, _) => data.date,
              yValueMapper: (DataDepartement data, _) => data.engineering,
              markerSettings: const MarkerSettings(
                  isVisible: true, image: AssetImage("image/Engineering.png")),
              name: "Engineering"),
          StackedColumnSeries<DataDepartement, int>(
              dataSource: _chartWeekly,
              xValueMapper: (DataDepartement data, _) => data.date,
              yValueMapper: (DataDepartement data, _) => data.itSupport,
              markerSettings: const MarkerSettings(
                  isVisible: true, image: AssetImage("image/IT Support.png")),
              name: "IT Support"),
          StackedColumnSeries<DataDepartement, int>(
              dataSource: _chartWeekly,
              xValueMapper: (DataDepartement data, _) => data.date,
              yValueMapper: (DataDepartement data, _) => data.concierge,
              markerSettings: const MarkerSettings(
                  isVisible: true, image: AssetImage("image/Concierge.png")),
              name: "Concierge"),
          StackedColumnSeries<DataDepartement, int>(
              dataSource: _chartWeekly,
              xValueMapper: (DataDepartement data, _) => data.date,
              yValueMapper: (DataDepartement data, _) => data.butler,
              markerSettings: const MarkerSettings(
                  isVisible: true, image: AssetImage("image/Butler.png")),
              name: "Butler"),
          StackedColumnSeries<DataDepartement, int>(
              dataSource: _chartWeekly,
              xValueMapper: (DataDepartement data, _) => data.date,
              yValueMapper: (DataDepartement data, _) => data.roomService,
              markerSettings: const MarkerSettings(
                  isVisible: true, image: AssetImage("image/Room Service.png")),
              name: "Room Service"),
        ],
        primaryXAxis: CategoryAxis(),
      ),
    );
  }

  List<DataDepartement> dataChartWeekly() {
    final List<DataDepartement> dataForChart = [
      DataDepartement(
          date: DateTime.monday,
          butler: 100,
          concierge: 98,
          engineering: 76,
          frontOffice: 93,
          houskeeping: 83,
          itSupport: 300,
          roomService: 97),
      DataDepartement(
          date: DateTime.tuesday,
          butler: 23,
          concierge: 56,
          engineering: 45,
          frontOffice: 67,
          houskeeping: 78,
          itSupport: 44,
          roomService: 32),
      DataDepartement(
          date: DateTime.wednesday,
          butler: 67,
          concierge: 45,
          engineering: 90,
          frontOffice: 23,
          houskeeping: 56,
          itSupport: 67,
          roomService: 89),
      DataDepartement(
          date: DateTime.thursday,
          butler: 83,
          concierge: 89,
          engineering: 67,
          frontOffice: 63,
          houskeeping: 86,
          itSupport: 66,
          roomService: 79),
      DataDepartement(
          date: DateTime.friday,
          butler: 77,
          concierge: 89,
          engineering: 77,
          frontOffice: 98,
          houskeeping: 89,
          itSupport: 20,
          roomService: 390),
      DataDepartement(
          date: DateTime.saturday,
          butler: 79,
          concierge: 220,
          engineering: 321,
          frontOffice: 52,
          houskeeping: 379,
          itSupport: 79,
          roomService: 37),
      DataDepartement(
          date: DateTime.sunday,
          butler: 92,
          concierge: 248,
          engineering: 274,
          frontOffice: 72,
          houskeeping: 251,
          itSupport: 12,
          roomService: 31),
    ];
    return dataForChart;
  }
}

class DataDepartement {
  DataDepartement(
      {this.houskeeping,
      this.frontOffice,
      this.butler,
      this.roomService,
      this.itSupport,
      this.concierge,
      this.engineering,
      this.date});
  int? date;
  int? houskeeping;
  int? frontOffice;
  int? butler;
  int? roomService;
  int? itSupport;
  int? engineering;
  int? concierge;
}
