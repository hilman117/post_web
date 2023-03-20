import 'package:flutter/material.dart';
import 'package:post_web/models/departement.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/models/weekly_report_model.dart';
import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../const.dart';

class WeeklyStackedCharhtColumn extends StatefulWidget {
  const WeeklyStackedCharhtColumn({Key? key}) : super(key: key);

  @override
  State<WeeklyStackedCharhtColumn> createState() =>
      _WeeklyStackedCharhtColumnState();
}

class _WeeklyStackedCharhtColumnState extends State<WeeklyStackedCharhtColumn> {
  late TooltipBehavior tooltip;

  @override
  void initState() {
    tooltip = TooltipBehavior(enable: true, shouldAlwaysShow: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<List<Departement>>(context);
    var tasks = Provider.of<List<TaskModel>>(context);
    final value = context.watch<ReportController>();
    final event = Provider.of<ReportController>(context, listen: false);
    event.weeklyreport(context, data, tasks);
    return SizedBox(
      child: SfCartesianChart(
        enableAxisAnimation: true,
        palette: [
          mainColor2,
          mainColor2.withOpacity(0.9),
          mainColor2.withOpacity(0.8),
          mainColor2.withOpacity(0.7),
          mainColor2.withOpacity(0.6),
          mainColor2.withOpacity(0.5),
          mainColor2.withOpacity(0.4),
          mainColor2.withOpacity(0.3),
          mainColor2.withOpacity(0.2),
          mainColor2.withOpacity(0.1),
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
        series: List.generate(
          value.deptActive.length,
          (index) => StackedColumnSeries<WeeklyReportModel, int>(
              // width: 100.w,
              dataSource: value.dataChartWeekly(index),
              xValueMapper: (WeeklyReportModel data, _) => data.date,
              yValueMapper: (WeeklyReportModel total, _) => total.totalRequest,
              markerSettings: const MarkerSettings(
                isVisible: true,
              ),
              name: value.deptActive[index].departement),
        ),
        // [
        // StackedColumnSeries<DataDepartement, int>(
        //     dataSource: _chartWeekly,
        //     xValueMapper: (DataDepartement data, _) => data.date,
        //     yValueMapper: (DataDepartement data, _) => data.houskeeping,
        //     markerSettings: const MarkerSettings(
        //         isVisible: true, image: AssetImage("image/Housekeeping.png")),
        //     name: "Housekeeping"),
        //   StackedColumnSeries<DataDepartement, int>(
        //       dataSource: _chartWeekly,
        //       xValueMapper: (DataDepartement data, _) => data.date,
        //       yValueMapper: (DataDepartement data, _) => data.frontOffice,
        //       markerSettings: const MarkerSettings(
        //           isVisible: true, image: AssetImage("image/Front Office.png")),
        //       name: "Front Office"),
        //   StackedColumnSeries<DataDepartement, int>(
        //       dataSource: _chartWeekly,
        //       xValueMapper: (DataDepartement data, _) => data.date,
        //       yValueMapper: (DataDepartement data, _) => data.engineering,
        //       markerSettings: const MarkerSettings(
        //           isVisible: true, image: AssetImage("image/Engineering.png")),
        //       name: "Engineering"),
        //   StackedColumnSeries<DataDepartement, int>(
        //       dataSource: _chartWeekly,
        //       xValueMapper: (DataDepartement data, _) => data.date,
        //       yValueMapper: (DataDepartement data, _) => data.itSupport,
        //       markerSettings: const MarkerSettings(
        //           isVisible: true, image: AssetImage("image/IT Support.png")),
        //       name: "IT Support"),
        //   StackedColumnSeries<DataDepartement, int>(
        //       dataSource: _chartWeekly,
        //       xValueMapper: (DataDepartement data, _) => data.date,
        //       yValueMapper: (DataDepartement data, _) => data.concierge,
        //       markerSettings: const MarkerSettings(
        //           isVisible: true, image: AssetImage("image/Concierge.png")),
        //       name: "Concierge"),
        //   StackedColumnSeries<DataDepartement, int>(
        //       dataSource: _chartWeekly,
        //       xValueMapper: (DataDepartement data, _) => data.date,
        //       yValueMapper: (DataDepartement data, _) => data.butler,
        //       markerSettings: const MarkerSettings(
        //           isVisible: true, image: AssetImage("image/Butler.png")),
        //       name: "Butler"),
        //   StackedColumnSeries<DataDepartement, int>(
        //       dataSource: _chartWeekly,
        //       xValueMapper: (DataDepartement data, _) => data.date,
        //       yValueMapper: (DataDepartement data, _) => data.roomService,
        //       markerSettings: const MarkerSettings(
        //           isVisible: true, image: AssetImage("image/Room Service.png")),
        //       name: "Room Service"),
        // ],
        primaryXAxis: CategoryAxis(),
      ),
    );
  }
}
