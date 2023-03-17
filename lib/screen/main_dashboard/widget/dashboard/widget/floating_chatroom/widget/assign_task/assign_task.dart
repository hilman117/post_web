import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../reusable_widget/no_button.dart';
import '../../../../../../../../reusable_widget/yes_button.dart';
import '../../../../../../../../style.dart';
import 'widget/group_list.dart';
import 'widget/team_list.dart';

assignTaskDialog(BuildContext context, String idTask, String titleTask,
    String locationTask) {
  final controller = Provider.of<ChatroomControlller>(context, listen: false);
  TextEditingController search = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Container(
          width: 700.w,
          height: 400.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(style: style18Normal, children: [
                TextSpan(text: "Assign request from", style: style20Normal),
                TextSpan(
                    text: " $locationTask",
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: " $titleTask",
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
                TextSpan(text: " to:", style: style20Normal)
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
                    style: style20Normal,
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
                    children: const [GroupList(), TeamLIst()],
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
                      child: NoButton(
                        fontSize: 16.sp,
                        width: 150.w,
                        callback: () {
                          Navigator.of(context).pop();
                          controller.cleaList();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    SizedBox(
                        height: 40.h,
                        child: Consumer<ChatroomControlller>(
                          builder: (context, value, child) => YesButton(
                            callback: value.assignTo.isNotEmpty
                                ? () => controller.assignTask(
                                    context, idTask, search)
                                : null,
                            fontSize: 16.sp,
                            nameButton: "Assign",
                            width: 150.w,
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
