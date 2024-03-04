import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:provider/provider.dart';

import '../../../../../reusable_widget/button.dart';

createDepartmentDialog(BuildContext context) {
  final theme = Theme.of(context);
  final settingController =
      Provider.of<SettingsController>(context, listen: false);
  TextEditingController depatName = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: FittedBox(
          child: Container(
            width: 350.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: theme.cardColor),
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Consumer2<SettingsController, MainDashboardController>(
                  builder: (context, value, value2, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: depatName,
                      decoration: InputDecoration(
                          hintText: "Department name",
                          hintStyle: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 5.sp,
                            vertical: 0,
                          ),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                      autofocus: true,
                      cursorHeight: 15.h,
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 10.sp),
                    Wrap(
                      runSpacing: 15.sp,
                      spacing: 10.sp,
                      children: departementIcon
                          .map((e) => InkWell(
                                onTap: () =>
                                    settingController.selectDeptIcon(e),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: value.iconName == e
                                              ? mainColor
                                              : Colors.transparent),
                                      borderRadius: BorderRadius.circular(3.r)),
                                  padding: EdgeInsets.all(2.sp),
                                  child: Image.asset(
                                    e,
                                    height: 30.h,
                                    width: 30.w,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 10.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonCustom(
                            isEnable: false,
                            height: 25.h,
                            widht: 70.w,
                            fontSize: 13.sp,
                            onPressed: () => Navigator.of(context).pop(),
                            buttonLabel: "Cancel"),
                        ButtonCustom(
                            height: 25.h,
                            widht: 70.w,
                            fontSize: 13.sp,
                            isWithLoading: true,
                            loadingState: value.isNewDepartementLoading,
                            onPressed: () => settingController
                                .registeNewDepartement(context, depatName),
                            buttonLabel: "Create")
                      ],
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      );
    },
  );
}
