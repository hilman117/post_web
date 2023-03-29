import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/reusable_widget/no_button.dart';
import 'package:post_web/reusable_widget/yes_button.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
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
    final mainCtrl = context.watch<MainDashboardController>();
    final description = TextEditingController();
    final createFunction =
        Provider.of<CreateController>(context, listen: false);
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r)),
        margin: EdgeInsets.only(top: 5.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputForm(
              callback: () {
                showDepartementOption(context);
              },
              icon: Icons.assignment,
              label: dashboardCtrl.selecteddepartement != ""
                  ? dashboardCtrl.selecteddepartement
                  : "Choose departement",
              isEmpty: dashboardCtrl.selecteddepartement != "" ? false : true,
              funtion: () => dashboardCtrl.clearSelectedDept(),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.sp),
              margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
              height: 40.h,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5.w, color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade100,
                      blurRadius: 0.5,
                      spreadRadius: 0.5,
                      offset: const Offset(0.5, 0.5))
                ],
              ),
              child: const InputTitle(),
            )),
            Row(
              children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.sp),
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.sp, vertical: 10.sp),
                      height: 40.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5.w, color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8.r),
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
            InputDescriptionWidget(
              controller: description,
            ),
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
                  callback: () async {
                    await createCtrl.createTask(
                        context: context,
                        departementSendTo: dashboardCtrl.selecteddepartement,
                        hotelName: mainCtrl.userDetails!.hotel!,
                        description: description,
                        emailSender: mainCtrl.userDetails!.email!,
                        deptSender: mainCtrl.userDetails!.department!,
                        positionSender: mainCtrl.userDetails!.position!,
                        imageProfileSender: mainCtrl.userDetails!.profileImage!,
                        senderName: mainCtrl.userDetails!.name!,
                        colorUser: mainCtrl.userDetails!.userColor!,
                        listAdminEmail: mainCtrl.data!.admin!);
                    dashboardCtrl.clearSelectedDept();
                  },
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
