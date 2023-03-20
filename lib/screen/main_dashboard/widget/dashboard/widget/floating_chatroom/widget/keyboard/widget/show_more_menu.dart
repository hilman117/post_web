import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/close_task_dialog.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';
import '../../../controller_floating_chatroom.dart';
import '../../assign_task/assign_task.dart';
import 'pop_up_item_widget.dart';

void showMoreMenu(
    BuildContext context,
    String status,
    String taskId,
    String titleTask,
    TextEditingController commentBody,
    String locationTask) async {
  final event = Provider.of<ChatroomControlller>(context, listen: false);
  // final value = context.watch<ChatroomControlller>();
  await showMenu(
      context: context,
      position:
          RelativeRect.fromLTRB(double.infinity, double.maxFinite, 40.w, 30.h),
      items: [
        PopupMenuItem(
          height: 40.h,
          padding: EdgeInsets.all(2.sp),
          child: PopUpMenuItemWidget(
            styTextLabel: style18Normal,
            // heightItem: 40.h,
            icon: Icons.check,
            iconColor: Colors.green,
            iconSize: 28.sp,
            itemMenuName: 'Accept',
          ),
          value: 'Accept',
          onTap: () => event.accepTask(context, taskId),
        ),
        PopupMenuItem(
            height: 40.h,
            padding: EdgeInsets.all(2.sp),
            child: PopUpMenuItemWidget(
              styTextLabel: style18Normal,
              // heightItem: 40.h,
              icon: Icons.assignment,
              iconSize: 28.sp,
              itemMenuName: 'Assign',
            ),
            value: 'Assign',
            onTap: () => Future.delayed(
                const Duration(milliseconds: 500),
                () => assignTaskDialog(
                    context, taskId, titleTask, locationTask))),
        PopupMenuItem(
          height: 40.h,
          padding: EdgeInsets.all(2.sp),
          child: PopUpMenuItemWidget(
            styTextLabel: style18Normal,
            // heightItem: 40.h,
            icon: Icons.close,
            iconColor: Colors.grey,
            iconSize: 28.sp,
            itemMenuName: 'Close',
          ),
          value: 'Close',
          onTap: () => Future.delayed(const Duration(milliseconds: 500),
              () => closeTaskDialog(context, taskId)),
        ),
        PopupMenuItem(
          height: 40.h,
          padding: EdgeInsets.all(2.sp),
          child: PopUpMenuItemWidget(
            styTextLabel: style18Normal,
            // heightItem: 40.h,
            icon: status == "Hold" ? Icons.play_arrow_rounded : Icons.pause,
            iconColor: status == "Hold" ? mainColor2 : Colors.grey,
            iconSize: 28.sp,
            itemMenuName: status == "Hold" ? "Resume" : 'Hold',
          ),
          value: status == "Hold" ? "Resume" : 'Hold',
          onTap: status == "Hold"
              ? () => event.resumeTask(context, taskId)
              : () => event.holdTask(context, taskId),
        ),
        PopupMenuItem(
          height: 40.h,
          padding: EdgeInsets.all(2.sp),
          child: PopUpMenuItemWidget(
            styTextLabel: style18Normal,
            // heightItem: 40.h,
            icon: Icons.camera_alt_rounded,
            iconSize: 28.sp,
            itemMenuName: 'Image',
          ),
          value: 'Image',
          onTap: () => event.selectImage(),
        ),
      ]);
}
