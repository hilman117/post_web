import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/firebase/firebase_stream_data.dart';
import 'package:provider/provider.dart';
import '../../controller_dashboard.dart';
import 'widget/chip_filter.dart';
import 'widget/filter_by_status.dart';
import 'widget/search_box.dart';
import 'widget/streaming_task_widget.dart';
import 'widget/table_title.dart';

class RowTitle extends StatefulWidget {
  final String departement;
  final String status;
  final BoxConstraints p1;

  const RowTitle({
    Key? key,
    required this.p1,
    required this.departement,
    required this.status,
  }) : super(key: key);

  @override
  State<RowTitle> createState() => _RowTitleState();
}

class _RowTitleState extends State<RowTitle> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> streamTask;

  @override
  void initState() {
    streamTask = FirebaseStreamData().task();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DashboardController>(context, listen: false);
    final valueDashboard = context.watch<DashboardController>();
    // var tasks = Provider.of<List<TaskModel>>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 1850.w,
          // height: 900.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
                              ChipFilter(
                                text: valueDashboard.department == ""
                                    ? "All departement"
                                    : valueDashboard.department,
                                showCancelButton:
                                    valueDashboard.department == ""
                                        ? false
                                        : true,
                                clearFunction: () =>
                                    controller.clearDepartementFilter(),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              ChipFilter(
                                text: valueDashboard.filterbyStatus == ""
                                    ? "All Status"
                                    : valueDashboard.filterbyStatus,
                                showCancelButton:
                                    valueDashboard.filterbyStatus == ""
                                        ? false
                                        : true,
                                clearFunction: () =>
                                    controller.clearStatusFilter(),
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
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 0.5,
                                spreadRadius: 0.5,
                                offset: Offset(0.5, 0.5))
                          ],
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.grey.shade200,
                        ),
                        child: Row(
                          children: List.generate(
                              valueDashboard.status.length,
                              (index) => InkWell(
                                    onTap: () => controller.selectStatus(
                                        index, valueDashboard.status[index]),
                                    child: FilterByStatus(
                                      status: valueDashboard.status[index],
                                      index: index,
                                    ),
                                  )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            alignment: Alignment.centerRight,
                            height: 50.h,
                            child: const SearchBox()),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                //widget that showing title of the column
                const TableTitle(),
                SizedBox(
                  height: 20.h,
                ),
                const Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 20.h,
                ),
                StreamingTaskWidget(
                    streamTask: streamTask,
                    valueDashboard: valueDashboard,
                    controller: controller)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
