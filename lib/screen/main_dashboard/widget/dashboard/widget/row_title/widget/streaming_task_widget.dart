import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../models/task.dart';
import '../../../controller_dashboard.dart';
import 'request_card.dart';

class StreamingTaskWidget extends StatefulWidget {
  const StreamingTaskWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DashboardController controller;

  @override
  State<StreamingTaskWidget> createState() => _StreamingTaskWidgetState();
}

class _StreamingTaskWidgetState extends State<StreamingTaskWidget>
    with SingleTickerProviderStateMixin {
  Animatable<Color?> bgColor = TweenSequence<Color?>([
    TweenSequenceItem(
        tween: ColorTween(begin: Colors.white, end: Colors.blue.shade100),
        weight: 1.0),
    TweenSequenceItem(
        tween: ColorTween(begin: Colors.blue.shade100, end: Colors.white),
        weight: 1.0),
    TweenSequenceItem(
        tween: ColorTween(begin: Colors.white, end: Colors.blue.shade100),
        weight: 1.0),
    TweenSequenceItem(
        tween: ColorTween(begin: Colors.blue.shade100, end: Colors.white),
        weight: 1.0),
  ]);
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
        reverseDuration: const Duration(seconds: 2))
      ..repeat(reverse: true);
    _controller
        .animateTo(1.0)
        .then<TickerFuture>((value) => _controller.animateBack(0.0));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                  return AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => RequestCard(
                            animatedBgColor: taskModel.isFading == true
                                ? bgColor.evaluate(
                                    AlwaysStoppedAnimation(_controller.value))
                                : Colors.white,
                            index: index,
                            taskModel: taskModel,
                          ));
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
                  return AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => RequestCard(
                            animatedBgColor: taskModel.isFading == true
                                ? bgColor.evaluate(
                                    AlwaysStoppedAnimation(_controller.value))
                                : Colors.white,
                            index: index,
                            taskModel: taskModel,
                          ));
                } else if (dashboardCtrl.filterbyStatus
                        .toLowerCase()
                        .contains("open") &&
                    taskModel.status != "Close" &&
                    dashboardCtrl.department == "") {
                  return AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => RequestCard(
                            animatedBgColor: taskModel.isFading == true
                                ? bgColor.evaluate(
                                    AlwaysStoppedAnimation(_controller.value))
                                : Colors.white,
                            index: index,
                            taskModel: taskModel,
                          ));
                } else if (dashboardCtrl.filterbyStatus
                        .toLowerCase()
                        .contains("open") &&
                    taskModel.status != "Close" &&
                    dashboardCtrl.department
                        .toLowerCase()
                        .contains(taskModel.sendTo!.toLowerCase())) {
                  return AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => RequestCard(
                            animatedBgColor: taskModel.isFading == true
                                ? bgColor.evaluate(
                                    AlwaysStoppedAnimation(_controller.value))
                                : Colors.white,
                            index: index,
                            taskModel: taskModel,
                          ));
                } else if (dashboardCtrl.filterbyStatus == "" &&
                    dashboardCtrl.department == "") {
                  return AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => RequestCard(
                            animatedBgColor: taskModel.isFading == true
                                ? bgColor.evaluate(
                                    AlwaysStoppedAnimation(_controller.value))
                                : Colors.white,
                            index: index,
                            taskModel: taskModel,
                          ));
                }
                return const SizedBox();
              }),
        ));
  }
}
