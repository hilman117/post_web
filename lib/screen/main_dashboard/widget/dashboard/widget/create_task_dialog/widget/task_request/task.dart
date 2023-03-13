import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/reusable_widget/no_button.dart';
import 'package:post_web/reusable_widget/yes_button.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/create_task_dialog/controller/controller_create_task.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/about_title/widget/pop_up_departement.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../reusable_widget/texfield.dart';
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
    final createCtrl = context.watch<CreateController>();
    final createFunction =
        Provider.of<CreateController>(context, listen: false);
    return GestureDetector(
      onTap: () => createFunction.hideePopUp(),
      child: Container(
        margin: EdgeInsets.only(top: 5.h),
        child: Column(
          children: [
            Row(
              children: [
                InputForm(
                  callback: () {
                    if (createCtrl.isPopUpTitle) {
                      createFunction.hideePopUp();
                    }
                    showDepartementOption(context);
                  },
                  icon: Icons.assignment,
                  label: dashboardCtrl.selecteddepartement != ""
                      ? dashboardCtrl.selecteddepartement
                      : "Choose departement",
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                    child: CompositedTransformTarget(
                      link: createCtrl.layerlink,
                      child: Focus(
                        onFocusChange: (value) {
                          createFunction.hideePopUp();
                          createFunction.searchingFocuse(titleNewBool: value);
                          createFunction.showPopUpTitle(context, value);
                        },
                        child: TexfieldWidget(
                          searchFunction: (value) {
                            createFunction.searchingTitle(value);
                          },
                          fontHeight: 18.h,
                          bgCOlor: Colors.white,
                          hintText: "Search title",
                          height: 50.h,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                    child: CompositedTransformTarget(
                      link: createCtrl.layerlink,
                      child: Focus(
                        onFocusChange: (value) {
                          createFunction.hideePopUp();
                          createFunction.showPopUpLocation(context, value);
                          createFunction.searchingFocuse(
                              locationNewBool: value);
                        },
                        child: TexfieldWidget(
                          fontHeight: 18.h,
                          bgCOlor: Colors.white,
                          hintText: "Search Location",
                          height: 50.h,
                        ),
                      ),
                    ),
                  ),
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
      ),
    );
  }
}
