import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/reusable_widget/button.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../models/task.dart';
import 'widget/group_list.dart';
import 'widget/team_list.dart';

assignTaskDialog(BuildContext context, TaskModel task) {
  final controller = Provider.of<ChatroomControlller>(context, listen: false);
  TextEditingController search = TextEditingController();
  final theme = Theme.of(context);
  return showDialog(
    context: context,
    builder: (context) {
      return Consumer<ChatroomControlller>(
        builder: (context, value, child) => AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: theme.primaryColor,
          content: Container(
            width: 700.w,
            height: 400.h,
            decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: theme.canvasColor,
                            fontWeight: FontWeight.normal),
                        children: [
                      TextSpan(
                          text: "Assign request from",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: theme.canvasColor,
                              fontWeight: FontWeight.normal)),
                      TextSpan(
                          text: " ${task.location}",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: theme.canvasColor,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: " ${task.title}",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: theme.canvasColor,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: " to:",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: theme.canvasColor,
                              fontWeight: FontWeight.normal))
                    ])),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                    height: 35.h,
                    child: TextFormField(
                      controller: search,
                      onChanged: (value) {
                        controller.searchingOnAssignDialog(value);
                      },
                      textAlignVertical: TextAlignVertical.center,
                      cursorHeight: 20.h,
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.normal,
                          color: theme.canvasColor),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 20.sp),
                        hintText: 'Search',
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20.sp,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.5, color: mainColor2)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.5, color: mainColor2)),
                      ),
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [groupList(context), teamList(context)],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          height: 40.h,
                          child: ButtonCustom(
                            isEnable: false,
                            buttonLabel: "Cancel",
                            widht: 150.w,
                            fontSize: 18.sp,
                            onPressed: () => Navigator.of(context).pop(),
                          )),
                      SizedBox(
                        width: 20.w,
                      ),
                      SizedBox(
                          height: 40.h,
                          child: ButtonCustom(
                            buttonLabel: "Assign",
                            widht: 150.w,
                            fontSize: 18.sp,
                            onPressed: value.assignTo.isNotEmpty
                                ? () => controller.assignTask(
                                    context, task.id!, search)
                                : null,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
