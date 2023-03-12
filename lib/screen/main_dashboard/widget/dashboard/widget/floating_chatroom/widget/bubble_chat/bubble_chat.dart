import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:post_web/models/chat_model.dart';
import 'package:post_web/const.dart';
import 'package:post_web/style.dart';

import 'widget/action_bubble.dart';
import 'widget/message/message_widget.dart';

class BubbleChat extends StatelessWidget {
  const BubbleChat({
    Key? key,
    required this.p2,
    required this.isMe,
    required this.chatModel,
    required this.listMessage,
    required this.index,
  }) : super(key: key);
  final bool isMe;
  final BoxConstraints p2;
  // ignore: prefer_typing_uninitialized_variables
  final ChatModel chatModel;
  final List<ChatModel> listMessage;
  final int index;

  @override
  Widget build(BuildContext context) {
    DateTime convertedTimeStampToDatetime =
        DateTime.parse(chatModel.time!.toDate().toString());
    var dateChat =
        DateFormat("MMM d, ''yy'").format(convertedTimeStampToDatetime);
    bool isVisible = false;
    if (listMessage.length - 1 == index) {
      isVisible = true;
    } else {
      var previousChat = listMessage[index + 1];
      var currentChat = listMessage[index];
      var previousTime = DateFormat("MMM d, ''yy'")
          .format(DateTime.parse(previousChat.time!.toDate().toString()));
      var currentTime = DateFormat("MMM d, ''yy'")
          .format(DateTime.parse(currentChat.time!.toDate().toString()));
      if (currentTime != previousTime) {
        isVisible = true;
      }
    }
    return Column(
      children: [
        if (isVisible)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            width: double.infinity,
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1.h,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    dateChat,
                    style: chatTime,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1.h,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        (chatModel.commentBody != "" ||
                chatModel.description != "" ||
                chatModel.imageComment!.isNotEmpty &&
                    chatModel.accepted == "" &&
                    chatModel.assignTask == "" &&
                    chatModel.hold == "" &&
                    chatModel.newlocation == "" &&
                    chatModel.scheduleDelete == "" &&
                    chatModel.setDate == "" &&
                    chatModel.titleChange == "")
            ? MessageWidget(isMe: isMe, p2: p2, chatModel: chatModel)
            : const SizedBox(),
        (chatModel.commentBody == "" &&
                chatModel.description == "" &&
                chatModel.imageComment!.isEmpty &&
                chatModel.accepted != "" &&
                chatModel.assignTask == "" &&
                chatModel.hold == "" &&
                chatModel.newlocation == "" &&
                chatModel.scheduleDelete == "" &&
                chatModel.setDate == "" &&
                chatModel.titleChange == "")
            ? ActionBubble(
                time: convertedTimeStampToDatetime.toString(),
                actionMessage: "${chatModel.accepted!} has accept this request",
                icons: Icons.check_circle,
                iconColor: Colors.green,
                chatModel: chatModel,
              )
            : const SizedBox(),
        (chatModel.commentBody == "" &&
                chatModel.description == "" &&
                chatModel.imageComment!.isEmpty &&
                chatModel.accepted == "" &&
                chatModel.assignTo != "" &&
                chatModel.hold == "" &&
                chatModel.newlocation == "" &&
                chatModel.scheduleDelete == "" &&
                chatModel.setDate == "" &&
                chatModel.titleChange == "")
            ? ActionBubble(
                time: convertedTimeStampToDatetime.toString(),
                actionMessage:
                    "${chatModel.sender} has assigned this task to ${chatModel.assignTo}",
                icons: Icons.assignment,
                iconColor: mainColor,
                chatModel: chatModel,
              )
            : const SizedBox(),
        (chatModel.commentBody == "" &&
                chatModel.description == "" &&
                chatModel.imageComment!.isEmpty &&
                chatModel.accepted == "" &&
                chatModel.assignTask == "" &&
                chatModel.hold != "" &&
                chatModel.newlocation == "" &&
                chatModel.scheduleDelete == "" &&
                chatModel.setDate == "" &&
                chatModel.titleChange == "")
            ? ActionBubble(
                time: convertedTimeStampToDatetime.toString(),
                actionMessage: chatModel.hold!,
                icons: Icons.pause,
                iconColor: Colors.grey,
                chatModel: chatModel,
              )
            : const SizedBox(),
        (chatModel.commentBody == "" &&
                chatModel.description == "" &&
                chatModel.imageComment!.isEmpty &&
                chatModel.accepted == "" &&
                chatModel.assignTask == "" &&
                chatModel.hold == "" &&
                chatModel.newlocation != "" &&
                chatModel.scheduleDelete == "" &&
                chatModel.setDate == "" &&
                chatModel.titleChange == "")
            ? ActionBubble(
                time: convertedTimeStampToDatetime.toString(),
                actionMessage: chatModel.newlocation!,
                icons: Icons.edit_location_alt,
                iconColor: Colors.blue,
                chatModel: chatModel,
              )
            : const SizedBox(),
        (chatModel.commentBody == "" &&
                chatModel.description == "" &&
                chatModel.imageComment!.isEmpty &&
                chatModel.accepted == "" &&
                chatModel.assignTask == "" &&
                chatModel.hold == "" &&
                chatModel.newlocation == "" &&
                chatModel.scheduleDelete != "" &&
                chatModel.setDate == "" &&
                chatModel.titleChange == "")
            ? ActionBubble(
                time: convertedTimeStampToDatetime.toString(),
                actionMessage: chatModel.scheduleDelete!,
                icons: Icons.delete_outlined,
                iconColor: Colors.red,
                chatModel: chatModel,
              )
            : const SizedBox(),
        (chatModel.commentBody == "" &&
                chatModel.description == "" &&
                chatModel.imageComment!.isEmpty &&
                chatModel.accepted == "" &&
                chatModel.assignTask == "" &&
                chatModel.hold == "" &&
                chatModel.newlocation == "" &&
                chatModel.scheduleDelete == "" &&
                chatModel.setDate != "" &&
                chatModel.titleChange == "")
            ? ActionBubble(
                time: convertedTimeStampToDatetime.toString(),
                actionMessage: chatModel.setDate!,
                icons: Icons.schedule_outlined,
                iconColor: Colors.blue,
                chatModel: chatModel,
              )
            : const SizedBox(),
        (chatModel.commentBody == "" &&
                chatModel.description == "" &&
                chatModel.imageComment!.isEmpty &&
                chatModel.accepted == "" &&
                chatModel.assignTask == "" &&
                chatModel.hold == "" &&
                chatModel.newlocation == "" &&
                chatModel.scheduleDelete == "" &&
                chatModel.setDate == "" &&
                chatModel.titleChange != "")
            ? ActionBubble(
                time: convertedTimeStampToDatetime.toString(),
                actionMessage: chatModel.titleChange!,
                icons: Icons.edit,
                iconColor: Colors.grey,
                chatModel: chatModel,
              )
            : const SizedBox(),
      ],
    );
  }
}
