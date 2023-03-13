import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../models/task.dart';
import '../../../controller_dashboard.dart';
import 'request_card.dart';

class StreamingTaskWidget extends StatelessWidget {
  const StreamingTaskWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    var requestData = Provider.of<List<TaskModel>>(context);
    final dashboardCtrl = context.watch<DashboardController>();
    return SizedBox(
        width: double.infinity,
        height: 600.h,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: true),
          child: ListView.builder(
              itemCount: requestData.length,
              itemBuilder: (BuildContext context, int index) {
                requestData.sort((a, b) => b.time!.compareTo(a.time!));
                TaskModel taskModel = requestData[index];
                if (dashboardCtrl.department
                        .toLowerCase()
                        .contains(taskModel.sendTo!.toLowerCase()) &&
                    dashboardCtrl.filterbyStatus == "") {
                  return RequestCard(
                    index: index,
                    taskModel: taskModel,
                  );
                } else if (dashboardCtrl.filterbyStatus
                        .toLowerCase()
                        .contains(taskModel.status!.toLowerCase()) &&
                    dashboardCtrl.department == "") {
                  return RequestCard(
                    index: index,
                    taskModel: taskModel,
                  );
                } else if (dashboardCtrl.filterbyStatus
                        .toLowerCase()
                        .contains(taskModel.status!.toLowerCase()) &&
                    dashboardCtrl.department
                        .toLowerCase()
                        .contains(taskModel.sendTo!.toLowerCase())) {
                  return RequestCard(
                    index: index,
                    taskModel: taskModel,
                  );
                } else if (dashboardCtrl.filterbyStatus
                        .toLowerCase()
                        .contains("open") &&
                    taskModel.status != "Close" &&
                    dashboardCtrl.department == "") {
                  return RequestCard(
                    index: index,
                    taskModel: taskModel,
                  );
                } else if (dashboardCtrl.filterbyStatus
                        .toLowerCase()
                        .contains("open") &&
                    taskModel.status != "Close" &&
                    dashboardCtrl.department
                        .toLowerCase()
                        .contains(taskModel.sendTo!.toLowerCase())) {
                  return RequestCard(
                    index: index,
                    taskModel: taskModel,
                  );
                } else if (dashboardCtrl.filterbyStatus == "" &&
                    dashboardCtrl.department == "") {
                  return RequestCard(
                    index: index,
                    taskModel: taskModel,
                  );
                }
                return const SizedBox();
              }),
        ));
  }
}
