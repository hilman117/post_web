import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/other.dart';

import 'package:post_web/screen/main_dashboard/widget/setting/widget/task_settings/widget/title/title.dart';
import 'package:post_web/style.dart';

class TaskSettings extends StatelessWidget {
  const TaskSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        color: mainColor.withOpacity(0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Task Settings", style: style20Bold),
            SizedBox(
              height: 20.h,
            ),
            const Divider(),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                // LocationList(),
                SizedBox(
                  width: 120.w,
                ),
                const TitleSettings()
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
          ],
        ));
  }
}
