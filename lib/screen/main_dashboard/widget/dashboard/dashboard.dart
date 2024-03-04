import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';

import 'package:provider/provider.dart';

import '../../../../models/departement.dart';
import '../../../../reusable_widget/department.dart';
import 'widget/row_title/row_title.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<TaskModel> tasksList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var data = Provider.of<List<Departement>>(context);
    final theme = Theme.of(context);
    final controller = Provider.of<DashboardController>(context, listen: false);
    return Container(
        alignment: Alignment.topCenter,
        width: size.width,
        color: theme.scaffoldBackgroundColor,
        child: LayoutBuilder(
          builder: (p0, p1) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Dashboard",
                        style: TextStyle(
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold,
                            color: theme.canvasColor),
                      ),
                      SizedBox(
                        width: p1.maxWidth * 0.020,
                      ),
                      Expanded(
                        child: SizedBox(
                            height: 130.h,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  Departement departement = data[index];
                                  //below code to show total how many request that still open for every departement
                                  var task = tasksList.where((element) =>
                                      element.sendTo ==
                                          departement.departement &&
                                      element.status != "Close");
                                  var newStatus = tasksList.where((element) =>
                                      element.sendTo ==
                                          departement.departement &&
                                      element.status == "New");
                                  //filtering only departement with isactive == true that will display
                                  if (departement.isActive == true) {
                                    return Consumer<DashboardController>(
                                        builder: (context, value, child) {
                                      return Department(
                                        newStatus: newStatus.length,
                                        buttonName: departement.departement!,
                                        callback: () =>
                                            controller.selectDepartment(index,
                                                departement.departement!),
                                        index: index,
                                        color: value.selectedDepartment == index
                                            ? Colors.green
                                            : const Color(0xff8E99C0),
                                        totalRequest: task.length,
                                        icon: departement.departementIcon!,
                                        departements: data,
                                      );
                                    });
                                  }
                                  return const SizedBox();
                                })),
                      )
                    ],
                  ),
                  SizedBox(
                    height: p1.maxHeight * 0.03,
                  ),
                  RowTitle(
                    p1: p1,
                    tasksList: tasksList,
                  ),
                ],
              )),
            ),
          ),
        ));
  }
}
