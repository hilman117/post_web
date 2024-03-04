import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/close_task_dialog.dart';
import 'package:provider/provider.dart';
import '../../../controller_floating_chatroom.dart';
import '../../assign_task/assign_task.dart';
import 'pop_up_item_widget.dart';

void showMoreMenu(BuildContext context, TextEditingController commentBody,
    TaskModel task) async {
  final event = Provider.of<ChatroomControlller>(context, listen: false);
  // final value = context.watch<ChatroomControlller>();
  final theme = Theme.of(context);
  await showMenu(
      context: context,
      position:
          RelativeRect.fromLTRB(double.infinity, double.maxFinite, 40.w, 30.h),
      items: [
        PopupMenuItem(
          height: 40.h,
          padding: EdgeInsets.all(2.sp),
          value: 'Accept',
          onTap: () => event.accepTask(context, task.id!),
          child: PopUpMenuItemWidget(
            styTextLabel: TextStyle(
                fontSize: 18.sp,
                color: theme.canvasColor,
                fontWeight: FontWeight.normal),
            // heightItem: 40.h,
            icon: Icons.check,
            iconColor: Colors.green,
            iconSize: 28.sp,
            itemMenuName: 'Accept',
          ),
        ),
        PopupMenuItem(
            height: 40.h,
            padding: EdgeInsets.all(2.sp),
            value: 'Assign',
            onTap: () => Future.delayed(const Duration(milliseconds: 500),
                () => assignTaskDialog(context, task)),
            child: PopUpMenuItemWidget(
              styTextLabel: TextStyle(
                  fontSize: 18.sp,
                  color: theme.canvasColor,
                  fontWeight: FontWeight.normal),
              // heightItem: 40.h,
              icon: Icons.assignment,
              iconSize: 28.sp,
              itemMenuName: 'Assign',
            )),
        PopupMenuItem(
          height: 40.h,
          padding: EdgeInsets.all(2.sp),
          value: 'Close',
          onTap: () => Future.delayed(const Duration(milliseconds: 500),
              () => closeTaskDialog(context, task)),
          child: PopUpMenuItemWidget(
            styTextLabel: TextStyle(
                fontSize: 18.sp,
                color: theme.canvasColor,
                fontWeight: FontWeight.normal),
            // heightItem: 40.h,
            icon: Icons.close,
            iconColor: Colors.grey,
            iconSize: 28.sp,
            itemMenuName: 'Close',
          ),
        ),
        PopupMenuItem(
          height: 40.h,
          padding: EdgeInsets.all(2.sp),
          value: task.status == "Hold" ? "Resume" : 'Hold',
          onTap: task.status == "Hold"
              ? () => event.resumeTask(context, task.id!)
              : () => event.holdTask(context, task.id!),
          child: PopUpMenuItemWidget(
            styTextLabel: TextStyle(
                fontSize: 18.sp,
                color: theme.canvasColor,
                fontWeight: FontWeight.normal),
            // heightItem: 40.h,
            icon:
                task.status == "Hold" ? Icons.play_arrow_rounded : Icons.pause,
            iconColor: task.status == "Hold" ? mainColor2 : Colors.grey,
            iconSize: 28.sp,
            itemMenuName: task.status == "Hold" ? "Resume" : 'Hold',
          ),
        ),
        PopupMenuItem(
          height: 40.h,
          padding: EdgeInsets.all(2.sp),
          value: 'Image',
          onTap: () => event.selectImage(),
          child: PopUpMenuItemWidget(
            styTextLabel: TextStyle(
                fontSize: 18.sp,
                color: theme.canvasColor,
                fontWeight: FontWeight.normal),
            // heightItem: 40.h,
            icon: Icons.camera_alt_rounded,
            iconSize: 28.sp,
            itemMenuName: 'Image',
          ),
        ),
      ]);
}
