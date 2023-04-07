import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:post_web/models/chat_model.dart';
import 'package:post_web/style.dart';

import 'widget/multiple_photos.dart';

Widget messageWidget(
    {required BuildContext context,
    required bool isMe,
    required int index,
    required BoxConstraints p2,
    required ChatModel chatModel,
    required List<ChatModel> listMessage}) {
  DateTime convertedTimeStampToDatetime = chatModel.time!.toDate();
  var color = int.parse(chatModel.colorUser!);
  final theme = Theme.of(context);
  bool isVisible = false;
  if (listMessage.length - 1 == index) {
    isVisible = false;
  } else {
    var previousChat = listMessage[index + 1];
    var currentChat = listMessage[index];
    if (previousChat.sender == currentChat.sender) {
      isVisible = true;
    }
  }

  Widget bubble = Container(
    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
    width: 450.w,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isMe
              ? theme.scaffoldBackgroundColor
              : Color(color).withOpacity(0.1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          !isVisible
              ? Text(
                  chatModel.sender!,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: isMe ? theme.canvasColor : Color(color),
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.fade,
                )
              : const SizedBox(),
          chatModel.description != ""
              ? Text(
                  chatModel.description!,
                  style: style18Normal,
                  overflow: TextOverflow.clip,
                )
              : const SizedBox(),
          chatModel.commentBody != ""
              ? Text(
                  chatModel.commentBody!,
                  style: style18Normal,
                  overflow: TextOverflow.clip,
                )
              : const SizedBox(),
          chatModel.imageComment!.isEmpty
              ? const SizedBox()
              : SizedBox(
                  height: 300.h,
                  width: 300.w,
                  child: MultiplePhoto(
                      images: chatModel.imageComment!,
                      moreThan4: 100.w,
                      isEqualorLessThan1: 300.w))
        ],
      ),
    ),
  );
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isMe
            ? Text(
                DateFormat.Hm().format(convertedTimeStampToDatetime),
                style: chatTime,
              )
            : bubble,
        const Spacer(),
        isMe
            ? bubble
            : Text(
                DateFormat.Hm().format(convertedTimeStampToDatetime),
                style: chatTime,
              )
      ],
    ),
  );
}
