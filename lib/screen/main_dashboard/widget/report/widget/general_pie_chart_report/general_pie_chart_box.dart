import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../controller_report.dart';

class GeneralPieChartBox extends StatefulWidget {
  const GeneralPieChartBox({Key? key, required this.listPieData})
      : super(key: key);
  final List<PieData> listPieData;

  @override
  State<StatefulWidget> createState() => GeneralPieChartBoxState();
}

class GeneralPieChartBoxState extends State<GeneralPieChartBox> {
  // ignore: library_private_types_in_public_api
  late List<PieData> sourcePieData;
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    sourcePieData = widget.listPieData;
    tooltipBehavior = TooltipBehavior(enable: true, shouldAlwaysShow: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
        child: FittedBox(
      child: Container(
        width: 700.w,
        height: 500.h,
        margin: EdgeInsets.all(10.sp),
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(25.sp),
        ),
        child: Consumer<ReportController>(builder: (context, value, child) {
          return SfCircularChart(
              margin: const EdgeInsets.all(0),
              tooltipBehavior: tooltipBehavior,
              title: ChartTitle(text: 'Request Departements'),
              legend: Legend(
                  isVisible: value.selectedDept.isNotEmpty ? false : true),
              series: <PieSeries<PieData, String>>[
                PieSeries<PieData, String>(
                    explode: true,
                    explodeIndex: 0,
                    dataSource: widget.listPieData,
                    xValueMapper: (PieData data, _) => data.xData,
                    yValueMapper: (PieData data, _) => data.yData,
                    dataLabelMapper: (PieData data, _) => data.text,
                    dataLabelSettings: const DataLabelSettings(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      isVisible: true,
                    )),
              ]);
        }),
      ),
    ));
  }
}
