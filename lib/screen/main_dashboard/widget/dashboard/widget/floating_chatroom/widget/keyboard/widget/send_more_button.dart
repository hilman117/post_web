import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:provider/provider.dart';

import 'show_more_menu.dart';

class SendAndMoreButton extends StatelessWidget {
  const SendAndMoreButton({
    Key? key,
    required this.idTask,
    required this.commentText,
    required this.titleTask,
    required this.locationTask,
    required this.status,
    // required this.scrollController,
  }) : super(key: key);

  final String idTask;
  final String titleTask;
  final String locationTask;
  final String status;
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
            InkWell(
              onTap: () => showMoreMenu(context, status, idTask, titleTask,
                  commentText, locationTask),
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  height: 30.h,
                  width: 30.w,
                  decoration: const BoxDecoration(),
                  child: Icon(
                    Icons.more_vert_rounded,
                    size: 30.sp,
                  )),
            ),
            if (value.textToSend != "")
              InkWell(
                onTap: () => event.sendComment(context, idTask, commentText),
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    height: 30.h,
                    width: 30.w,
                    decoration: const BoxDecoration(),
                    child: Image.asset(
                      'image/send1.png',
                      width: 30.w,
                    )),
              ),
          ],
        ));
  }
}
