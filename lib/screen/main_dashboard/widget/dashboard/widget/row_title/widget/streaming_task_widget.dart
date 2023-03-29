import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../../../models/task.dart';
import '../../../controller_dashboard.dart';
import 'request_card.dart';

Widget streamTask(BuildContext context) {
  var requestData = Provider.of<List<TaskModel>>(context);
  final value = context.watch<DashboardController>();
  var taskWithSchedule = requestData
      .where((element) =>
          element.setTime!.isNotEmpty || element.setDate!.isNotEmpty)
      .toList();
  return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      height: 600.h,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: true),
        child: value.isSchedule == false
            //if [ISSCHEDULE==FALSE] task list without schedule will display
            ? generalTaskList(context: context, requestData: requestData)
            //below task list with schedule
            : ListView.builder(
                itemCount: taskWithSchedule.length,
                itemBuilder: (BuildContext context, int index) {
                  requestData.sort((a, b) => b.time!.compareTo(a.time!));
                  TaskModel taskModel = taskWithSchedule[index];
                  return RequestCard(
                    index: index,
                    taskModel: taskModel,
                  );
                }),
      ));
}

Widget generalTaskList(
    {required BuildContext context, required List<TaskModel> requestData}) {
  final value = context.watch<DashboardController>();
  return ListView.builder(
      itemCount: requestData.length,
      itemBuilder: (BuildContext context, int index) {
        requestData.sort((a, b) => b.time!.compareTo(a.time!));
        TaskModel taskModel = requestData[index];
        if (value.department
                .toLowerCase()
                .contains(taskModel.sendTo!.toLowerCase()) &&
            value.filterbyStatus == "") {
          return RequestCard(
            index: index,
            taskModel: taskModel,
          );
        } else if (value.filterbyStatus
                .toLowerCase()
                .contains(taskModel.status!.toLowerCase()) &&
            value.department == "") {
          return RequestCard(
            index: index,
            taskModel: taskModel,
          );
        } else if (value.filterbyStatus
                .toLowerCase()
                .contains(taskModel.status!.toLowerCase()) &&
            value.department
                .toLowerCase()
                .contains(taskModel.sendTo!.toLowerCase())) {
          return RequestCard(
            index: index,
            taskModel: taskModel,
          );
        } else if (value.filterbyStatus.toLowerCase().contains("open") &&
            taskModel.status != "Close" &&
            value.department == "") {
          return RequestCard(
            index: index,
            taskModel: taskModel,
          );
        } else if (value.filterbyStatus.toLowerCase().contains("open") &&
            taskModel.status != "Close" &&
            value.department
                .toLowerCase()
                .contains(taskModel.sendTo!.toLowerCase())) {
          return RequestCard(
            index: index,
            taskModel: taskModel,
          );
        } else if (value.filterbyStatus == "" && value.department == "") {
          return RequestCard(
            index: index,
            taskModel: taskModel,
          );
        }
        return const SizedBox();
      });
}
