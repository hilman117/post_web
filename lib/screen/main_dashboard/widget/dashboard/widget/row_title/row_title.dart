import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:provider/provider.dart';
import '../../../../../../models/task.dart';
import '../../controller_dashboard.dart';
import 'widget/chip_filter.dart';
import 'widget/filter_by_status.dart';
import 'widget/search_box.dart';
import 'widget/streaming_task_widget.dart';
import 'widget/table_title.dart';

class RowTitle extends StatefulWidget {
  final BoxConstraints p1;

  const RowTitle({
    Key? key,
    required this.p1,
    required this.tasksList,
  }) : super(key: key);
  final List<TaskModel> tasksList;

  @override
  State<RowTitle> createState() => _RowTitleState();
}

class _RowTitleState extends State<RowTitle> {
  @override
  void initState() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DashboardController>(context, listen: false);
    final theme = Theme.of(context);
    return Consumer2<DashboardController, MainDashboardController>(
      builder: (context, value, value2, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 1850.w,
            // height: 900.h,
            decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 50.h,
                            child: Row(
                              children: [
                                chipFilter(
                                  context,
                                  value.department == ""
                                      ? "All departement"
                                      : value.department,
                                  value.department == "" ? false : true,
                                  () => controller.clearDepartementFilter(),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                chipFilter(
                                  context,
                                  value.filterbyStatus == ""
                                      ? "All Status"
                                      : value.filterbyStatus,
                                  value.filterbyStatus == "" ? false : true,
                                  () => controller.clearStatusFilter(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2.5,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: value2.isDarkMode
                                      ? Colors.transparent
                                      : Colors.grey,
                                  blurRadius: 0.5,
                                  spreadRadius: 0.5,
                                  offset: const Offset(0.5, 0.5))
                            ],
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.grey.shade200,
                          ),
                          child: Row(
                            children: List.generate(
                                value.status.length,
                                (index) => InkWell(
                                      onTap: () {
                                        controller.selectStatus(context, index,
                                            value.status[index]);
                                      },
                                      child: filterByStatus(
                                        context: context,
                                        status: value.status[index],
                                        index: index,
                                      ),
                                    )),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              height: 50.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Scheduled",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: theme.canvasColor,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Transform.scale(
                                    scale: 0.5,
                                    child: Switch.adaptive(
                                      trackColor: Theme.of(context)
                                          .switchTheme
                                          .trackColor,
                                      thumbColor: Theme.of(context)
                                          .switchTheme
                                          .thumbColor,
                                      value: value.isSchedule,
                                      onChanged: (value) =>
                                          controller.filterWithSchedule(value),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50.w,
                                  ),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () {},
                                    child: Material(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: theme.primaryColor,
                                            shape: BoxShape.circle),
                                        width: 40.w,
                                        height: 40.h,
                                        child: Icon(
                                          Icons.print,
                                          size: 25.sp,
                                          color: theme.iconTheme.color,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50.w,
                                  ),
                                  SizedBox(
                                      width: 200.w, child: const SearchBox()),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  //widget that showing title of the column
                  tableTitle(context),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  streamTask(
                      context,
                      value.statusSelected != 1
                          ? widget.tasksList
                          : value.historyTask)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
