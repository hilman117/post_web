import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/models/chat_model.dart';
import 'package:post_web/style.dart';

class ActionBubble extends StatelessWidget {
  const ActionBubble({
    Key? key,
    required this.time,
    required this.actionMessage,
    required this.icons,
    required this.iconColor,
    required this.chatModel,
  }) : super(key: key);

  final String time;
  final String actionMessage;
  final IconData icons;
  final Color iconColor;
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    final user = Get.put(CUser());
    bool isMe = chatModel.senderemail == user.data.email ? true : false;
    Widget action = Row(
      children: [
        isMe
            ? Padding(
                padding: EdgeInsets.only(
                    right: !isMe ? 20.w : 5.w, left: isMe ? 20.w : 5.w),
                child: SizedBox(
                  width: 330.w,
                  child: Text(
                    actionMessage,
                    style: style15Normal,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.end,
                  ),
                ),
              )
            : Icon(
                icons,
                size: 20.sp,
                color: iconColor,
              ),
        SizedBox(
          width: 10.w,
        ),
        isMe
            ? Icon(
                icons,
                size: 20.sp,
                color: iconColor,
              )
            : Padding(
                padding: EdgeInsets.only(
                    right: !isMe ? 20.w : 5.w, left: isMe ? 20.w : 5.w),
                child: SizedBox(
                  width: 330.w,
                  child: Text(
                    actionMessage,
                    style: style15Normal,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.start,
                  ),
                ),
              )
      ],
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      alignment: Alignment.center,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isMe
              ? Text(
                  DateFormat.Hm().format(DateTime.parse(time)),
                  style: chatTime,
                )
              : action,
          isMe
              ? action
              : Text(
                  DateFormat.Hm().format(DateTime.parse(time)),
                  style: chatTime,
                )
        ],
      ),
    );
  }
}
