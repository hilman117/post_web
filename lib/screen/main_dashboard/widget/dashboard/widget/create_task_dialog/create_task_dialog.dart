import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/create_task_dialog/widget/task_request/task.dart';
import 'package:provider/provider.dart';

import 'controller/controller_create_task.dart';

createTaskDialog(BuildContext context) {
  return showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return CustomDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
          child: Consumer<CreateController>(
            builder: (context, value, child) => Container(
              // alignment: Alignment.bottomCenter,
              height: 700.h,
              width: 700.w,
              decoration: BoxDecoration(
                  color: mainColor2, borderRadius: BorderRadius.circular(6.r)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.sp, vertical: 10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Create",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            Icons.close_rounded,
                            size: 20.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child:
                          Container(color: Colors.white, child: const Task()))
                ],
              ),
            ),
          ));
    },
  );
}
