import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:post_web/screen/main_dashboard/widget/setting/widget/employee_account/widget/employee_account_list.dart';

class EmployeeAccount extends StatelessWidget {
  const EmployeeAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const EmployeeAccountList(),
            SizedBox(
              height: 20.h,
            ),
          ],
        ));
  }
}
