import 'package:flutter/material.dart';
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
        child: SfCircularChart(
            tooltipBehavior: tooltipBehavior,
            palette: const [
              Color(0xff1D9B88),
              Color(0xff72CABD),
              Color(0xff34BFAA),
              Color(0xff23DFC3),
              Color(0xff85FBE9),
              Color(0xffDEFDF7),
            ],
            title: ChartTitle(text: 'Sales by sales person'),
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
                    isVisible: true,
                  )),
            ]));
  }

  // Widget build(BuildContext context) {
  //   final size = MediaQuery.of(context).size;
  //   return Container(
  //       height: size.height * 0.3,
  //       width: size.width * 0.35,
  //       decoration: BoxDecoration(
  //           boxShadow: const [
  //             BoxShadow(
  //                 blurRadius: 2, offset: Offset(1.0, 1.0), color: Colors.grey)
  //           ],
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(10),
  //           border: Border.all(color: Colors.grey.shade200, width: 0.5)),
  //       child: LayoutBuilder(
  //         builder: (p0, p1) => Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             SizedBox(
  //                 width: p1.maxWidth * 0.25,
  //                 child: PieChartReport(
  //                   fixSize: p1,
  //                 )),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Row(
  //                   children: [
  //                     const ContainerMark(
  //                       color: Color(0xff0293ee),
  //                     ),
  //                     SizedBox(
  //                       width: p1.maxWidth * 0.01,
  //                     ),
  //                     Text(
  //                       "IT Support",
  //                       style: TextStyle(
  //                           fontSize: p1.maxWidth * 0.025, color: Colors.grey),
  //                     )
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: p1.maxWidth * 0.01,
  //                 ),
  //                 Row(
  //                   children: [
  //                     const ContainerMark(
  //                       color: Color(0xfff8b250),
  //                     ),
  //                     SizedBox(
  //                       width: p1.maxWidth * 0.01,
  //                     ),
  //                     Text(
  //                       "Front Office",
  //                       style: TextStyle(
  //                           fontSize: p1.maxWidth * 0.025, color: Colors.grey),
  //                     )
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: p1.maxWidth * 0.01,
  //                 ),
  //                 Row(
  //                   children: [
  //                     const ContainerMark(
  //                       color: Color(0xff845bef),
  //                     ),
  //                     SizedBox(
  //                       width: p1.maxWidth * 0.01,
  //                     ),
  //                     Text(
  //                       "Housekeeping",
  //                       style: TextStyle(
  //                           fontSize: p1.maxWidth * 0.025, color: Colors.grey),
  //                     )
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: p1.maxWidth * 0.01,
  //                 ),
  //                 Row(
  //                   children: [
  //                     const ContainerMark(
  //                       color: Color(0xff13d38e),
  //                     ),
  //                     SizedBox(
  //                       width: p1.maxWidth * 0.01,
  //                     ),
  //                     Text(
  //                       "Engineering",
  //                       style: TextStyle(
  //                           fontSize: p1.maxWidth * 0.025, color: Colors.grey),
  //                     )
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: p1.maxWidth * 0.01,
  //                 ),
  //                 Row(
  //                   children: [
  //                     const ContainerMark(
  //                       color: Colors.yellow,
  //                     ),
  //                     SizedBox(
  //                       width: p1.maxWidth * 0.01,
  //                     ),
  //                     Text(
  //                       "Room Service",
  //                       style: TextStyle(
  //                           fontSize: p1.maxWidth * 0.025, color: Colors.grey),
  //                     )
  //                   ],
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //       ));
  // }
}

class _PieData {
  _PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}
