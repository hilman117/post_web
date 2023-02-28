import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/box_10_most/most_10_location.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/box_10_most/most_10_creator.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/box_10_most/most_10_receiver.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/box_10_most/most_10_title.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/department_card.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/filter/filter_box.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/stacked_chart_column.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/general_pie_chart_report/general_pie_chart_box.dart';
import 'package:provider/provider.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ReportState();
}

class ReportState extends State {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Provider.of<ReportController>(context, listen: false);
    return GestureDetector(
        onTap: () => controller.hideFlotingFilter(),
        behavior: HitTestBehavior.translucent,
        child: Consumer<ReportController>(
          builder: (context, value, child) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.03),
                  Consumer<ReportController>(
                    builder: (context, value, child) => Container(
                      width: size.width,
                      alignment: Alignment.center,
                      height: size.height * 0.13,
                      child: SizedBox(
                          height: size.height * 0.13,
                          child: LayoutBuilder(
                            builder: (p0, p1) => ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: value.department.length,
                              itemBuilder: (context, index) => DepartmentCard(
                                department: value.department[index],
                                percent: value.percent[index],
                                totalOfRequest: value.totalOfRequest[index],
                                p1: p1,
                                index: index,
                              ),
                            ),
                          )),
                    ),
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
              ),
            ),
          ),
        ));
  }
}
