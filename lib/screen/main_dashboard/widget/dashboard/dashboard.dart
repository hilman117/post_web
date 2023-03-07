import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';

import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

import '../../../../models/departement.dart';
import 'widget/department.dart';

import 'widget/row_title/row_title.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var data = Provider.of<List<Departement>>(context);
    var task = Provider.of<List<TaskModel>>(context);
    final controller = Provider.of<DashboardController>(context, listen: false);
    return Container(
        alignment: Alignment.topCenter,
        width: size.width,
        color: const Color(0xffF8F8FA),
        child: LayoutBuilder(
            builder: (p0, p1) => Consumer<DashboardController>(
                  builder: (context, value, child) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
                              style: style24SemiBold,
                            ),
                            SizedBox(
                              width: p1.maxWidth * 0.020,
                            ),
                            Expanded(
                              child: SizedBox(
                                  height: 70.h,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: data.length,
                                      itemBuilder: (context, index) {
                                        Departement departement = data[index];

                                        //filtering only departement with isactive == true that will display
                                        if (departement.isActive == true) {
                                          return MouseRegion(
                                            onEnter: (event) =>
                                                controller.hovering(
                                                    isDeptementInHover: true,
                                                    departementIndex: index),
                                            onExit: (event) =>
                                                controller.hovering(
                                                    isDeptementInHover: false),
                                            child: Department(
                                              buttonName:
                                                  departement.departement!,
                                              callback: () =>
                                                  controller.selectDepartment(
                                                      index,
                                                      departement.departement!),
                                              p1: p1,
                                              index: index,
                                              color: Colors.white,
                                              totalRequest: task.length,
                                              icon:
                                                  departement.departementIcon!,
                                            ),
                                          );
                                        }
                                        return const SizedBox();
                                      })),
                            )
                          ],
                        ),
                        SizedBox(
                          height: p1.maxHeight * 0.03,
                        ),
                        Consumer<DashboardController>(
                            builder: (context, value, child) => RowTitle(
                                  p1: p1,
                                  departement: value.department,
                                  status: value.filterbyStatus,
                                ))
                      ],
                    )),
                  ),
                )));
  }
}
