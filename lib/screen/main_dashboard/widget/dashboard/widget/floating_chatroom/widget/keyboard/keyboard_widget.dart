import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:provider/provider.dart';
import 'widget/send_more_button.dart';

class KeyboardWidget extends StatelessWidget {
  const KeyboardWidget({Key? key, required this.task}) : super(key: key);

  final TaskModel task;
  static final TextEditingController commentText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<ChatroomControlller>(context, listen: false);
    final theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 20.h, left: 5.w),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                // height: 40.h,
                child: CupertinoTextField(
                  autofocus: true,
                  maxLines: 5,
                  minLines: 1,
                  controller: commentText,
                  placeholder: "Type here...",
                  placeholderStyle: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.grey.shade300,
                      fontWeight: FontWeight.normal),
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: theme.canvasColor,
                      fontWeight: FontWeight.normal),
                  onChanged: (value) => event.typingTextToSend(value),
                  cursorColor: mainColor,
                )),
          ),
          SizedBox(
            width: 10.w,
          ),
          SendAndMoreButton(
            commentText: commentText,
            task: task,
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
    );
  }
}
