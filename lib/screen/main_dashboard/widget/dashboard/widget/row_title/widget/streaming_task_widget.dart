import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../models/task.dart';
import '../../../controller_dashboard.dart';
import 'request_card.dart';

class StreamingTaskWidget extends StatelessWidget {
  const StreamingTaskWidget({
    Key? key,
    required this.streamTask,
    required this.valueDashboard,
    required this.controller,
  }) : super(key: key);

  final Stream<QuerySnapshot<Map<String, dynamic>>> streamTask;
  final DashboardController valueDashboard;
  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 600.h,
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: streamTask,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }
            if (snapshot.data == null) {
              return const CircularProgressIndicator.adaptive();
            }
            List<QueryDocumentSnapshot<Object?>> list = snapshot.data!.docs;
            list.sort((a, b) => b["time"].compareTo(a["time"]));
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> data =
                      list[index].data()! as Map<String, dynamic>;
                  TaskModel taskModel = TaskModel.fromJson(data);
                  if (valueDashboard.department
                          .toLowerCase()
                          .contains(taskModel.sendTo!.toLowerCase()) &&
                      valueDashboard.filterbyStatus == "") {
                    return MouseRegion(
                      onEnter: (event) => controller.hovering(
                          cardRequestHover: true, index: index),
                      onExit: (event) =>
                          controller.hovering(cardRequestHover: false),
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
                      onEnter: (event) => controller.hovering(
                          cardRequestHover: true, index: index),
                      onExit: (event) =>
                          controller.hovering(cardRequestHover: false),
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
                      onEnter: (event) => controller.hovering(
                          cardRequestHover: true, index: index),
                      onExit: (event) =>
                          controller.hovering(cardRequestHover: false),
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
                      onEnter: (event) => controller.hovering(
                          cardRequestHover: true, index: index),
                      onExit: (event) =>
                          controller.hovering(cardRequestHover: false),
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
                      onEnter: (event) => controller.hovering(
                          cardRequestHover: true, index: index),
                      onExit: (event) =>
                          controller.hovering(cardRequestHover: false),
                      child: RequestCard(
                        index: index,
                        taskModel: taskModel,
                      ),
                    );
                  } else if (valueDashboard.filterbyStatus == "" &&
                      valueDashboard.department == "") {
                    return MouseRegion(
                      onEnter: (event) => controller.hovering(
                          cardRequestHover: true, index: index),
                      onExit: (event) =>
                          controller.hovering(cardRequestHover: false),
                      child: RequestCard(
                        index: index,
                        taskModel: taskModel,
                      ),
                    );
                  }
                  return const SizedBox();
                });
          },
        ));
  }
}
