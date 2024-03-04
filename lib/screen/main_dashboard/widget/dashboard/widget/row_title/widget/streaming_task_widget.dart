import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../../../models/task.dart';
import '../../../controller_dashboard.dart';
import 'request_card.dart';

Widget streamTask(BuildContext context, List<TaskModel> tasksList) {
  var taskWithSchedule = tasksList
      .where((element) =>
          element.setTime!.isNotEmpty || element.setDate!.isNotEmpty)
      .toList();
  return Consumer<DashboardController>(
    builder: (context, value, child) => Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        height: 600.h,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: true),
          child: value.isSchedule == false
              //if [ISSCHEDULE==FALSE] task list without schedule will display
              ? GeneralTaskList(requestData: tasksList)
              //below task list with schedule
              : ListView.builder(
                  itemCount: taskWithSchedule.length,
                  itemBuilder: (BuildContext context, int index) {
                    taskWithSchedule.sort((a, b) => b.time!.compareTo(a.time!));
                    TaskModel taskModel = taskWithSchedule[index];
                    return RequestCard(
                      index: index,
                      taskModel: taskModel,
                    );
                  }),
        )),
  );
}

class GeneralTaskList extends StatefulWidget {
  const GeneralTaskList({Key? key, required this.requestData})
      : super(key: key);
  final List<TaskModel> requestData;

  @override
  State<GeneralTaskList> createState() => _GeneralTaskListState();
}

class _GeneralTaskListState extends State<GeneralTaskList>
    with SingleTickerProviderStateMixin {
  // late AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
        builder: (context, value, child) => ListView.builder(
            itemCount: widget.requestData.length,
            itemBuilder: (BuildContext context, int index) {
              widget.requestData.sort((a, b) => b.time!.compareTo(a.time!));
              TaskModel taskModel = widget.requestData[index];
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
            }));
  }
}
