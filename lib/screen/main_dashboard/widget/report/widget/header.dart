import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../models/departement.dart';
import '../../../../../models/task.dart';
import '../../../../../reusable_widget/department.dart';
import '../controller_report.dart';

Widget headerWidget(
    {required BuildContext context,
    required List<Departement> listDepartement,
    required List<TaskModel> tasks}) {
  final event = Provider.of<ReportController>(context, listen: false);
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
                  var requestList = tasks.where(
                      (element) => element.sendTo == departement.departement);
                  //filtering only departement with isactive == true that will be display
                  if (departement.isActive == true) {
                    return Department(
                      buttonName: departement.departement!,
                      callback: () => event.departmenReportSelected(index),
                      index: index,
                      color: Colors.white,
                      totalRequest: requestList.length,
                      icon: departement.departementIcon!,
                      departements: listDepartement,
                    );
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
