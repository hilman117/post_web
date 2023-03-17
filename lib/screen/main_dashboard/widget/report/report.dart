import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/box_10_most/most_10_location.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/box_10_most/most_10_creator.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/box_10_most/most_10_receiver.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/box_10_most/most_10_title.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/filter/filter_box.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/stacked_chart_column.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/general_pie_chart_report/general_pie_chart_box.dart';
import 'package:provider/provider.dart';

import '../../../../models/departement.dart';
import '../../../../reusable_widget/department.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ReportState();
}

class ReportState extends State {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final event = Provider.of<ReportController>(context, listen: false);
    final value = context.watch<ReportController>();
    var data = Provider.of<List<Departement>>(context);
    return GestureDetector(
        onTap: () => event.hideFlotingFilter(),
        behavior: HitTestBehavior.translucent,
        child: ListView(
          children: [
            SizedBox(height: size.height * 0.03),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: SizedBox(
                  width: 1500.w,
                  // height: 70.h,
                  child: Wrap(
                    runSpacing: 50.h,
                    alignment: WrapAlignment.center,
                    children: List.generate(data.length, (index) {
                      var isActiveOnly =
                          data.where((element) => element.isActive == true);
                      Departement departement = data[index];
                      //filtering only departement with isactive == true that will display
                      if (departement.isActive == true) {
                        return Department(
                          buttonName: departement.departement!,
                          callback: () => event.departmenReportSelected(index),
                          index: index,
                          color: Colors.white,
                          totalRequest: 200,
                          icon: departement.departementIcon!,
                          departements: isActiveOnly,
                        );
                      }
                      return const SizedBox();
                    }),
                  )),
            ),
            SizedBox(height: size.height * 0.05),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: value.departmentIndexReport != -1
                  ? Container(
                      alignment: Alignment.centerRight,
                      width: size.width,
                      child: const FilterBox())
                  : const SizedBox(),
            ),
            SizedBox(height: size.height * 0.05),
            StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: const [
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: WeeklyStackedCharhtColumn(),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: GeneralPieChartBox(),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 4,
                  mainAxisCellCount: 1,
                  child: WeeklyStackedCharhtColumn(),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: MostTitle10(),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Most10Location(),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Most10Receiver(),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Most10Creator(),
                ),
              ],
            )
          ],
        ));
  }
}
