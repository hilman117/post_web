import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/reusable_widget/no_button.dart';
import 'package:post_web/reusable_widget/yes_button.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/create_task_dialog/controller/controller_create_task.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/create_task_dialog/widget/task_request/widget/input_title.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/about_title/widget/pop_up_departement.dart';
import 'package:provider/provider.dart';
import 'widget/input_description.dart';
import 'widget/input_form.dart';
import 'widget/input_location.dart';
import 'widget/uplaod_image_box.dart';

class Task extends StatelessWidget {
  const Task({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashboardCtrl = context.watch<DashboardController>();
    final createCtrl = context.watch<CreateController>();

    final createFunction =
        Provider.of<CreateController>(context, listen: false);
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        margin: EdgeInsets.only(top: 5.h),
        child: Column(
          children: [
            Row(
              children: [
                InputForm(
                  callback: () {
                    showDepartementOption(context);
                  },
                  icon: Icons.assignment,
                  label: dashboardCtrl.selecteddepartement != ""
                      ? dashboardCtrl.selecteddepartement
                      : "Choose departement",
                  isEmpty:
                      dashboardCtrl.selecteddepartement != "" ? false : true,
                  funtion: () => dashboardCtrl.clearSelectedDept(),
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      height: 40.h,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 0.5, color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade100,
                              blurRadius: 0.5,
                              spreadRadius: 0.5,
                              offset: const Offset(0.5, 0.5))
                        ],
                      ),
                      child: const InputTitle()),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      height: 40.h,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 0.5, color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade100,
                              blurRadius: 0.5,
                              spreadRadius: 0.5,
                              offset: const Offset(0.5, 0.5))
                        ],
                      ),
                      child: const InputLocation()),
                ),
                InputForm(
                  callback: () => createFunction.timePIcker(context),
                  icon: Icons.schedule_outlined,
                  label: createCtrl.selectedTime != ""
                      ? createCtrl.selectedTime
                      : "Set time",
                  isEmpty: createCtrl.selectedTime != "" ? false : true,
                  funtion: () => createCtrl.clearTime(),
                ),
                InputForm(
                  callback: () => createFunction.dateTimPicker(context),
                  icon: Icons.date_range_outlined,
                  label: createCtrl.newDate != ""
                      ? createCtrl.newDate
                      : "Set date",
                  isEmpty: createCtrl.newDate != "" ? false : true,
                  funtion: () => createCtrl.clearDate(),
                ),
              ],
            ),
            const InputDescriptionWidget(),
            InkWell(
                onTap: () => createFunction.selectImage(),
                child: const UploadImageBox()),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NoButton(
                  icon: Icons.close,
                  width: 200.w,
                  callback: () => Navigator.of(context).pop(),
                ),
                YesButton(
                  callback: () {},
                  icon: Icons.send_outlined,
                  nameButton: 'Send',
                  width: 200.w,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
