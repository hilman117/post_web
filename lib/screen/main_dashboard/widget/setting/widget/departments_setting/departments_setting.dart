import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/departments_setting/widget/all_departments_registered.dart';
import 'package:post_web/style.dart';
import 'widget/departement_for_task.dart';

class DepartmentSettings extends StatelessWidget {
  const DepartmentSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Departments Settings", style: style20Bold),
            Text("Register departement or group that can receive or send task",
                style: style18Normal),
            SizedBox(
              height: 40.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AllDepartmentRegistered(),
                SizedBox(
                  width: 50.w,
                ),
                const DepartementForTask()
              ],
            )
          ],
        ));
  }
}
