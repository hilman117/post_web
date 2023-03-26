import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:post_web/models/chat_model.dart';
import 'package:post_web/style.dart';

import 'widget/multiple_photos.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    Key? key,
    required this.isMe,
    required this.p2,
    required this.chatModel,
    required this.listMessage,
    required this.index,
  }) : super(key: key);

  final bool isMe;
  final int index;
  final BoxConstraints p2;
  final ChatModel chatModel;
  final List<ChatModel> listMessage;

  @override
  Widget build(BuildContext context) {
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
            color: isMe ? Colors.blue.shade50 : Color(color).withOpacity(0.1)),
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
                    style: theme.textTheme.bodySmall,
                    overflow: TextOverflow.clip,
                  )
                : const SizedBox(),
            chatModel.commentBody != ""
                ? Text(
                    chatModel.commentBody!,
                    style: theme.textTheme.bodySmall,
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
}
