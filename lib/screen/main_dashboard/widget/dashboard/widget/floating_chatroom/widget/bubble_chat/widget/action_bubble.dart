import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/models/chat_model.dart';
import 'package:post_web/style.dart';

Widget actionBubble(
    {required BuildContext context,
    required String time,
    required String actionMessage,
    required IconData icons,
    required Color iconColor,
    required ChatModel chatModel}) {
  final theme = Theme.of(context);
  final user = Get.put(CUser());
  bool isMe = chatModel.senderemail == user.data.email ? true : false;
  Widget action = Row(
    children: [
      isMe
          ? Padding(
              padding: EdgeInsets.only(
                  right: !isMe ? 20.w : 5.w, left: isMe ? 20.w : 5.w),
              child: SizedBox(
                width: 450.w,
                child: SelectableText(
                  actionMessage,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: theme.canvasColor,
                      fontWeight: FontWeight.normal),
                  // overflow: TextOverflow.clip,
                  textAlign: TextAlign.end,
                ),
              ),
            )
          : Icon(
              icons,
              size: 30.sp,
              color: iconColor,
            ),
      SizedBox(
        width: 10.w,
      ),
      isMe
          ? Icon(
              icons,
              size: 30.sp,
              color: iconColor,
            )
          : Padding(
              padding: EdgeInsets.only(
                  right: !isMe ? 20.w : 5.w, left: isMe ? 20.w : 5.w),
              child: SizedBox(
                width: 450.w,
                child: SelectableText(
                  actionMessage,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: theme.canvasColor,
                      fontWeight: FontWeight.normal),
                  // overflow: TextOverflow.clip,
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
