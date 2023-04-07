import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GeneralPieChartBox extends StatefulWidget {
  const GeneralPieChartBox({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartBoxState();
}

class PieChartBoxState extends State {
  List<_PieData> pieData() {
    List<_PieData> pieChartSource = [
      _PieData("Housekeeping", 320, "20%"),
      _PieData("Engineering", 234, "12%"),
      _PieData("Front Office", 125, "20%"),
      _PieData("Room Service", 32, "20%"),
      _PieData("Concierge", 78, "20%"),
      _PieData("IT Support", 32, "20%"),
      _PieData("Butler", 97, "20%"),
    ];
    return pieChartSource;
  }

  late List<_PieData> sourcePieData;
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    sourcePieData = pieData();
    tooltipBehavior = TooltipBehavior(enable: true, shouldAlwaysShow: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FittedBox(
      child: Container(
        width: 700.w,
        height: 500.h,
        margin: EdgeInsets.all(10.sp),
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.sp),
        ),
        child: SfCircularChart(
            margin: const EdgeInsets.all(0),
            tooltipBehavior: tooltipBehavior,
            palette: const [
              Color(0xff2E00EB),
              Color(0xff59C4F8),
              Color(0xff6438FB),
              Color(0xff190793),
              Color(0xff85FBE9),
              Color(0xffDEFDF7),
            ],
            title: ChartTitle(text: 'Request Departements'),
            legend: Legend(isVisible: true),
            series: <PieSeries<_PieData, String>>[
              PieSeries<_PieData, String>(
                  explode: true,
                  explodeIndex: 0,
                  dataSource: sourcePieData,
                  xValueMapper: (_PieData data, _) => data.xData,
                  yValueMapper: (_PieData data, _) => data.yData,
                  dataLabelMapper: (_PieData data, _) => data.text,
                  dataLabelSettings: const DataLabelSettings(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    isVisible: true,
                  )),
            ]),
      ),
    ));
  }
}

class _PieData {
  _PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}
