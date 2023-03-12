import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../models/task.dart';
import '../../../controller_dashboard.dart';
import 'request_card.dart';

class StreamingTaskWidget extends StatelessWidget {
  const StreamingTaskWidget({
    Key? key,
    required this.valueDashboard,
    required this.controller,
  }) : super(key: key);

  final DashboardController valueDashboard;
  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    var requestData = Provider.of<List<TaskModel>>(context);
    return SizedBox(
        width: double.infinity,
        height: 600.h,
        child: ListView.builder(
            itemCount: requestData.length,
            itemBuilder: (BuildContext context, int index) {
              requestData.sort((a, b) => b.time!.compareTo(a.time!));
              TaskModel taskModel = requestData[index];
              if (valueDashboard.department
                      .toLowerCase()
                      .contains(taskModel.sendTo!.toLowerCase()) &&
                  valueDashboard.filterbyStatus == "") {
                return MouseRegion(
                  onEnter: (event) => controller.hovering(index: index),
                  onExit: (event) => controller.hovering(index: -1),
                  child: RequestCard(
                    index: index,
                    taskModel: taskModel,
                  ),
                );
              } else if (valueDashboard.filterbyStatus
                      .toLowerCase()
                      .contains(taskModel.status!.toLowerCase()) &&
                  valueDashboard.department == "") {
                return MouseRegion(
                  onEnter: (event) => controller.hovering(index: index),
                  onExit: (event) => controller.hovering(index: -1),
                  child: RequestCard(
                    index: index,
                    taskModel: taskModel,
                  ),
                );
              } else if (valueDashboard.filterbyStatus
                      .toLowerCase()
                      .contains(taskModel.status!.toLowerCase()) &&
                  valueDashboard.department
                      .toLowerCase()
                      .contains(taskModel.sendTo!.toLowerCase())) {
                return MouseRegion(
                  onEnter: (event) => controller.hovering(index: index),
                  onExit: (event) => controller.hovering(index: -1),
                  child: RequestCard(
                    index: index,
                    taskModel: taskModel,
                  ),
                );
              } else if (valueDashboard.filterbyStatus
                      .toLowerCase()
                      .contains("open") &&
                  taskModel.status != "Close" &&
                  valueDashboard.department == "") {
                return MouseRegion(
                  onEnter: (event) => controller.hovering(index: index),
                  onExit: (event) => controller.hovering(index: -1),
                  child: RequestCard(
                    index: index,
                    taskModel: taskModel,
                  ),
                );
              } else if (valueDashboard.filterbyStatus
                      .toLowerCase()
                      .contains("open") &&
                  taskModel.status != "Close" &&
                  valueDashboard.department
                      .toLowerCase()
                      .contains(taskModel.sendTo!.toLowerCase())) {
                return MouseRegion(
                  onEnter: (event) => controller.hovering(index: index),
                  onExit: (event) => controller.hovering(index: -1),
                  child: RequestCard(
                    index: index,
                    taskModel: taskModel,
                  ),
                );
              } else if (valueDashboard.filterbyStatus == "" &&
                  valueDashboard.department == "") {
                return MouseRegion(
                  onEnter: (event) => controller.hovering(index: index),
                  onExit: (event) => controller.hovering(index: -1),
                  child: RequestCard(
                    index: index,
                    taskModel: taskModel,
                  ),
                );
              }
              return const SizedBox();
            }));
  }
}
