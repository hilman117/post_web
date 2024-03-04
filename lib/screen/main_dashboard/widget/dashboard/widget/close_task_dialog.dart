import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/reusable_widget/button.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:provider/provider.dart';

closeTaskDialog(BuildContext context, TaskModel task) {
  final ctrl = Provider.of<ChatroomControlller>(context, listen: false);
  final TextEditingController commentBody = TextEditingController();
  final theme = Theme.of(context);
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            surfaceTintColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(0),
            backgroundColor: theme.primaryColor,
            content: Container(
              width: 400.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Are you sure want to close this request?",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: theme.canvasColor,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "${task.location} - ${task.title}",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: theme.canvasColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                      height: 45.h,
                      child: CupertinoTextField(
                        controller: commentBody,
                        placeholder: "Description...",
                        style: TextStyle(
                            fontSize: 18.sp, color: theme.canvasColor),
                        placeholderStyle: TextStyle(
                            fontSize: 18.sp, color: Colors.grey.shade300),
                        cursorColor: mainColor,
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 45.h,
                          child: ButtonCustom(
                            buttonLabel: "Cancel",
                            isEnable: false,
                            fontSize: 18.sp,
                            widht: 150.w,
                            onPressed: () => Navigator.of(context).pop(),
                          )),
                      SizedBox(
                          height: 45.h,
                          child: ButtonCustom(
                            buttonLabel: "Yes",
                            widht: 150.w,
                            fontSize: 18.sp,
                            onPressed: () async {
                              await ctrl.closeTask(context, task, commentBody);
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                            },
                          ))
                    ],
                  )
                ],
              ),
            ),
          ));
}
