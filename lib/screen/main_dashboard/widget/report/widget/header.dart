import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/models/task.dart';
import 'package:provider/provider.dart';

import '../../../../../models/departement.dart';
import '../../../../../reusable_widget/department.dart';
import '../../../controller_main_dashboard.dart';
import '../controller_report.dart';

Widget headerWidget({required BuildContext context}) {
  final event = Provider.of<ReportController>(context, listen: false);
  final listDepartement = Provider.of<List<Departement>>(context);
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20.sp),
    width: double.infinity,
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        Expanded(
          child: SizedBox(
              height: 130.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listDepartement.length,
                itemBuilder: (context, index) {
                  Departement departement = listDepartement[index];
                  //filtering only departement with isactive == true that will be display
                  if (departement.isActive == true) {
                    return Consumer<ReportController>(
                        builder: (context, value, child) {
                      List<TaskModel> list = value.masterDataTask
                          .where((element) =>
                              element.sendTo == departement.departement)
                          .toList();

                      return Department(
                        buttonName: departement.departement!,
                        callback: () async {
                          await event.departmenReportSelected(departement);
                          // ignore: use_build_context_synchronously
                          event.reloadDataFilter(
                            context: context,
                            listDept: listDepartement,
                            // ignore: use_build_context_synchronously
                            generalData: Provider.of<MainDashboardController>(
                                    context,
                                    listen: false)
                                .data!,
                          );
                        },
                        index: index,
                        color: value.selectedDept == departement.departement
                            ? Colors.green
                            : const Color(0xff8E99C0),
                        totalRequest: list.length,
                        icon: departement.departementIcon!,
                        departements: listDepartement,
                      );
                    });
                  }
                  return const SizedBox();
                },
              )),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
      ],
    ),
  );
}
