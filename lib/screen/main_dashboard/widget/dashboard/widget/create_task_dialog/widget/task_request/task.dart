import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/reusable_widget/no_button.dart';
import 'package:post_web/reusable_widget/yes_button.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/about_title/widget/pop_up_departement.dart';
import 'package:provider/provider.dart';
import 'widget/input_description.dart';
import 'widget/input_form.dart';
import 'widget/uplaod_image_box.dart';

class Task extends StatelessWidget {
  const Task({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashboardCtrl = context.watch<DashboardController>();
    return Container(
      margin: EdgeInsets.only(top: 5.h),
      child: Column(
        children: [
          Row(
            children: [
              InputForm(
                callback: () => showDepartementOption(context),
                icon: Icons.assignment,
                label: dashboardCtrl.selecteddepartement != ""
                    ? dashboardCtrl.selecteddepartement
                    : "Choose departement",
              ),
              InputForm(
                callback: () {},
                icon: Icons.title,
                label: "Title",
              ),
            ],
          ),
          Row(
            children: [
              InputForm(
                callback: () {},
                icon: Icons.pin_drop_outlined,
                label: "Location",
              ),
              InputForm(
                callback: () {},
                icon: Icons.schedule_outlined,
                label: "Set time",
              ),
              InputForm(
                callback: () {},
                icon: Icons.date_range_outlined,
                label: "Set date",
              ),
            ],
          ),
          const InputDescriptionWidget(),
          const UploadImageBox(),
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
    );
  }
}
