import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';

import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

import '../../../../models/departement.dart';
import '../../../../reusable_widget/department.dart';

import 'widget/row_title/row_title.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var data = Provider.of<List<Departement>>(context);
    var tasks = Provider.of<List<TaskModel>>(context);
    final controller = Provider.of<DashboardController>(context, listen: false);
    return Container(
        alignment: Alignment.topCenter,
        width: size.width,
        color: const Color(0xffF8F8FA),
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
                                  //below code to show total how many request that still open for every departement
                                  var task = tasks.where((element) =>
                                      element.sendTo ==
                                          departement.departement &&
                                      element.status != "Close");
                                  var newStatus = tasks.where((element) =>
                                      element.sendTo ==
                                          departement.departement &&
                                      element.status == "New");
                                  //filtering only departement with isactive == true that will display
                                  if (departement.isActive == true) {
                                    return Department(
                                      newStatus: newStatus.length,
                                      buttonName: departement.departement!,
                                      callback: () =>
                                          controller.selectDepartment(
                                              index, departement.departement!),
                                      index: index,
                                      color: Colors.white,
                                      totalRequest: task.length,
                                      icon: departement.departementIcon!,
                                      departements: data,
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
                  RowTitle(
                    p1: p1,
                  ),
                  SizedBox(
                    height: 100.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Item perpage",
                            style:
                                TextStyle(fontSize: 20.sp, color: mainColor2)),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                            padding: EdgeInsets.all(2.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: mainColor2),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "100",
                                  style: TextStyle(
                                      fontSize: 20.sp, color: Colors.white),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                const Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: Colors.white,
                                )
                              ],
                            )),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          padding: EdgeInsets.all(5.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          padding: EdgeInsets.all(5.sp),
                          width: 200.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: mainColor2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "1",
                                style: TextStyle(
                                    fontSize: 20.sp, color: Colors.white),
                              ),
                              Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 20.sp, color: Colors.grey),
                              ),
                              Text(
                                "3",
                                style: TextStyle(
                                    fontSize: 20.sp, color: Colors.grey),
                              ),
                              Text(
                                "4. . .50",
                                style: TextStyle(
                                    fontSize: 20.sp, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          padding: EdgeInsets.all(5.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: mainColor2),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "1 of 50 pages",
                          style: TextStyle(fontSize: 20.sp, color: mainColor2),
                        ),
                      ],
                    ),
                  )
                ],
              )),
            ),
          ),
        ));
  }
}
