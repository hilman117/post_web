import 'package:flutter/material.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/general_pie_chart_report/widget/container_mark.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/general_pie_chart_report/widget/general_pie_chart_report.dart';

class DepartmentPieChart extends StatefulWidget {
  const DepartmentPieChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartBoxState();
}

class PieChartBoxState extends State {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.3,
        width: size.width * 0.35,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  blurRadius: 2, offset: Offset(1.0, 1.0), color: Colors.grey)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200, width: 0.5)),
        child: LayoutBuilder(
          builder: (p0, p1) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: p1.maxWidth * 0.25,
                  child: PieChartReport(
                    fixSize: p1,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const ContainerMark(
                        color: Color(0xff0293ee),
                      ),
                      SizedBox(
                        width: p1.maxWidth * 0.01,
                      ),
                      Text(
                        "Accepted",
                        style: TextStyle(
                            fontSize: p1.maxWidth * 0.025, color: Colors.grey),
                      )
                    ],
                  ),
                  SizedBox(
                    height: p1.maxWidth * 0.01,
                  ),
                  Row(
                    children: [
                      const ContainerMark(
                        color: Color(0xfff8b250),
                      ),
                      SizedBox(
                        width: p1.maxWidth * 0.01,
                      ),
                      Text(
                        "Close",
                        style: TextStyle(
                            fontSize: p1.maxWidth * 0.025, color: Colors.grey),
                      )
                    ],
                  ),
                  SizedBox(
                    height: p1.maxWidth * 0.01,
                  ),
                  Row(
                    children: [
                      const ContainerMark(
                        color: Color(0xff845bef),
                      ),
                      SizedBox(
                        width: p1.maxWidth * 0.01,
                      ),
                      Text(
                        "Hold",
                        style: TextStyle(
                            fontSize: p1.maxWidth * 0.025, color: Colors.grey),
                      )
                    ],
                  ),
                  SizedBox(
                    height: p1.maxWidth * 0.01,
                  ),
                  Row(
                    children: [
                      const ContainerMark(
                        color: Color(0xff13d38e),
                      ),
                      SizedBox(
                        width: p1.maxWidth * 0.01,
                      ),
                      Text(
                        "Ditugaskan",
                        style: TextStyle(
                            fontSize: p1.maxWidth * 0.025, color: Colors.grey),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
