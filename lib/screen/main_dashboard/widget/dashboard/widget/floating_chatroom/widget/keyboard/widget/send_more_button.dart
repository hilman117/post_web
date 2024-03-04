import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:provider/provider.dart';

import 'show_more_menu.dart';

class SendAndMoreButton extends StatelessWidget {
  const SendAndMoreButton({
    Key? key,
    required this.commentText,
    required this.task,
    // required this.scrollController,
  }) : super(key: key);
  final TaskModel task;
  final TextEditingController commentText;
  // final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    final event = Provider.of<ChatroomControlller>(context, listen: false);
    final value = context.watch<ChatroomControlller>();
    return AnimatedSwitcher(
        duration: Duration.zero,
        switchOutCurve: Curves.easeOutSine,
        child: Row(
          children: [
            value.textToSend != "" || value.imageList.isNotEmpty
                ? InkWell(
                    onTap: () =>
                        event.sendComment(context, task.id!, commentText),
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        height: 30.h,
                        width: 30.w,
                        child: Icon(
                          Icons.send,
                          size: 30.sp,
                        )),
                  )
                : InkWell(
                    onTap: () => showMoreMenu(context, commentText, task),
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        height: 30.h,
                        width: 30.w,
                        child: Icon(
                          Icons.more_vert_rounded,
                          size: 30.sp,
                        )),
                  ),
          ],
        ));
  }
}
