// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../models/departement.dart';
import 'box_bar_widget.dart';

Widget stickBar(
    {required List<Departement> data,
    required List<Map<String, dynamic>> result}) {
  return Consumer<ReportController>(builder: (context, value, child) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: List.generate(value.result.length, (index) {
        print(result[index]["group"]);
        print(result[index]["total"]);
        // int color = int.parse(value.dailyChartData[index].color!);
        // var chartData = value.dailyChartData[index];
        return boxBarWidget(
          index: index,
          colors: Colors.blue,
          deptName: result[index]["group"],
          totalRequest: int.parse(result[index]["total"]),
          value: int.parse(result[index]["total"]),
        );
      }),
    );
  });
}
