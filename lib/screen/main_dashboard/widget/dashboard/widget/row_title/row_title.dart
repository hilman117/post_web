import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/firebase/firebase_stream_data.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/const.dart';
import 'package:provider/provider.dart';
import '../../controller_dashboard.dart';
import 'widget/filter_by_status.dart';
import 'widget/request_card.dart';
import 'widget/search_box.dart';
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
  // late Stream<QuerySnapshot<Map<String, dynamic>>> streamTask;

  // @override
  // void initState() {
  //   streamTask =
  //   super.initState();
  // }

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
              child: Consumer<DashboardController>(
                builder: (context, value, child) => Column(
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
                              child: ChipFilter(controller: controller),
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
                                  value.status.length,
                                  (index) => InkWell(
                                        onTap: () => controller.selectStatus(
                                            index, value.status[index]),
                                        child: FilterByStatus(
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
                    SizedBox(
                        width: double.infinity,
                        height: 600.h,
                        child:
                            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          stream: FirebaseStreamData()
                              .task(widget.departement, widget.status),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                  child: Text('Something went wrong'));
                            }
                            if (snapshot.data == null) {
                              return const CircularProgressIndicator.adaptive();
                            }
                            List<QueryDocumentSnapshot<Object?>> list =
                                snapshot.data!.docs;
                            list.sort((a, b) => b["time"].compareTo(a["time"]));
                            return ListView.builder(
                                itemCount: list.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Map<String, dynamic> data = list[index]
                                      .data()! as Map<String, dynamic>;
                                  TaskModel taskModel =
                                      TaskModel.fromJson(data);
                                  if (valueDashboard.department.toLowerCase().contains(
                                          taskModel.sendTo!.toLowerCase()) &&
                                      valueDashboard.filterbyStatus == "") {
                                    return MouseRegion(
                                      onEnter: (event) => controller.hovering(
                                          cardRequestHover: true, index: index),
                                      onExit: (event) => controller.hovering(
                                          cardRequestHover: false),
                                      child: RequestCard(
                                        index: index,
                                        taskModel: taskModel,
                                      ),
                                    );
                                  } else if (valueDashboard.filterbyStatus.toLowerCase().contains(
                                          taskModel.status!.toLowerCase()) &&
                                      valueDashboard.department == "") {
                                    return MouseRegion(
                                      onEnter: (event) => controller.hovering(
                                          cardRequestHover: true, index: index),
                                      onExit: (event) => controller.hovering(
                                          cardRequestHover: false),
                                      child: RequestCard(
                                        index: index,
                                        taskModel: taskModel,
                                      ),
                                    );
                                  } else if (valueDashboard.filterbyStatus.toLowerCase().contains(
                                          taskModel.status!.toLowerCase()) &&
                                      valueDashboard.department.toLowerCase().contains(
                                          taskModel.sendTo!.toLowerCase())) {
                                    return MouseRegion(
                                      onEnter: (event) => controller.hovering(
                                          cardRequestHover: true, index: index),
                                      onExit: (event) => controller.hovering(
                                          cardRequestHover: false),
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
                                      onExit: (event) => controller.hovering(
                                          cardRequestHover: false),
                                      child: RequestCard(
                                        index: index,
                                        taskModel: taskModel,
                                      ),
                                    );
                                  } else if (valueDashboard.filterbyStatus
                                          .toLowerCase()
                                          .contains("open") &&
                                      taskModel.status != "Close" &&
                                      valueDashboard.department.toLowerCase().contains(
                                          taskModel.sendTo!.toLowerCase())) {
                                    return MouseRegion(
                                      onEnter: (event) => controller.hovering(
                                          cardRequestHover: true, index: index),
                                      onExit: (event) => controller.hovering(
                                          cardRequestHover: false),
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
                                      onExit: (event) => controller.hovering(
                                          cardRequestHover: false),
                                      child: RequestCard(
                                        index: index,
                                        taskModel: taskModel,
                                      ),
                                    );
                                  }
                                  return const SizedBox();
                                });
                          },
                        ))
                  ],
                ),
              )),
        ),
      ],
    );
  }
}

class ChipFilter extends StatelessWidget {
  const ChipFilter({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
        builder: (context, value, child) => FittedBox(
              child: Container(
                // width: 200.w,
                padding: EdgeInsets.all(5.sp),
                decoration: BoxDecoration(
                    border: Border.all(color: mainColor2.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                  children: [
                    Text(
                      value.selectedDepartment >= 0
                          ? value.department
                          : "All Departement",
                      style: TextStyle(fontSize: 18.sp, color: Colors.black54),
                      overflow: TextOverflow.clip,
                    ),
                    value.selectedDepartment >= 0 || value.statusSelected >= 0
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: InkWell(
                              onTap: () => controller.clearFilter(),
                              child: Icon(
                                Icons.cancel_outlined,
                                size: 20.sp,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ));
  }
}
