import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/main_dashboard/widget/create_task/controller_create_task.dart';
import 'package:provider/provider.dart';

Widget yesButton(
    {required BuildContext context,
    required String nameButton,
    double? width,
    VoidCallback? callback,
    IconData? icon,
    double? fontSize}) {
  return Consumer<CreateController>(
    builder: (context, value, child) => Container(
      margin: EdgeInsets.only(bottom: 5.h),
      width: width ?? 150.w,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: mainColor2,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: callback,
          child: value.isLoding
              ? SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: const CircularProgressIndicator())
              : Row(
                  mainAxisAlignment: icon != null
                      ? MainAxisAlignment.spaceEvenly
                      : MainAxisAlignment.center,
                  children: [
                    icon != null
                        ? Icon(
                            icon,
                            size: 20.sp,
                          )
                        : const SizedBox(),
                    Text(
                      nameButton,
                      style: TextStyle(fontSize: fontSize ?? 20.sp),
                    )
                  ],
                )),
    ),
  );
}
