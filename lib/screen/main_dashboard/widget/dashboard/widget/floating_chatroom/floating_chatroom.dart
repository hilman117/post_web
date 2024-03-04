import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/models/chat_model.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';
import '../../controller_dashboard.dart';
import '../row_title/widget/status_widget.dart';
import 'widget/bubble_chat/bubble_chat.dart';
import 'widget/keyboard/keyboard_widget.dart';
import '../../../../../../reusable_widget/reopen_button.dart';

class FloatingChatroom extends StatefulWidget {
  const FloatingChatroom({Key? key, required this.taskModel}) : super(key: key);
  final TaskModel taskModel;

  @override
  State<FloatingChatroom> createState() => _FloatingChatroomState();
}

class _FloatingChatroomState extends State<FloatingChatroom> {
  final user = Get.put(CUser());
  final scrollController = ScrollController();
  late Stream<DocumentSnapshot<Map<String, dynamic>>> streamChat;

  @override
  void initState() {
    streamChat = FirebaseFirestore.instance
        .collection('Hotel List')
        .doc(user.data.hotelid)
        .collection('tasks')
        .doc(widget.taskModel.id)
        .snapshots(includeMetadataChanges: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DashboardController>(context, listen: false);
    final chatCtrl = Provider.of<ChatroomControlller>(context, listen: false);
    final theme = Theme.of(context);
    return Positioned(
      right: 20.w,
      bottom: 30.h,
      child: Material(
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          // alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: const Color(0xffE8EEF8),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r)),
          ),
          height: 900.h,
          width: 600.w,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          height: 50.h,
                          width: 30.w,
                          child: Image.asset(
                            "${widget.taskModel.iconDepartement}",
                            width: 30.w,
                            height: 30.h,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.taskModel.location!,
                              style: style18Bold,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              widget.taskModel.title!,
                              style: style15Normal,
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (widget.taskModel.setDate != "" ||
                                widget.taskModel.setTime != "")
                              Icon(
                                Icons.schedule_rounded,
                                color: Colors.red,
                                size: 25.sp,
                              ),
                            Text(
                              widget.taskModel.setDate!,
                              style:
                                  TextStyle(fontSize: 15.sp, color: Colors.red),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              widget.taskModel.setTime!,
                              style:
                                  TextStyle(fontSize: 15.sp, color: Colors.red),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            InkWell(
                              onTap: () {
                                controller.clearCardRequest();
                                controller.hideChatroom();
                                chatCtrl.clearImage();
                              },
                              child: Icon(
                                Icons.close_rounded,
                                color: Colors.grey,
                                size: 30.sp,
                                shadows: const [
                                  Shadow(
                                      offset: Offset(0.1, 0.1),
                                      color: Colors.grey,
                                      blurRadius: 2)
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        statusWidget(
                            context: context,
                            width: 75.w,
                            fontSize: 13.sp,
                            verticalPadding: 1.h,
                            horizontalPadding: 2.w,
                            status: context
                                .watch<ChatroomControlller>()
                                .currentStatus)
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                            // alignment: Alignment.center,
                            width: double.infinity,
                            child: StreamBuilder<DocumentSnapshot>(
                                stream: streamChat,
                                builder: (context, snapshot) =>
                                    LayoutBuilder(builder: (p0, p2) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.active) {
                                        var commentList = (snapshot.data!.data()
                                                as Map<String, dynamic>)[
                                            'comment'] as List;

                                        commentList.sort((a, b) =>
                                            b['time'].compareTo(a['time']));
                                        List<ChatModel> chatModel = commentList
                                            .map((e) => ChatModel.fromJson(e))
                                            .toList();
                                        return ListView.builder(
                                            reverse: true,
                                            padding: EdgeInsets.only(
                                                right: 10.w,
                                                left: 10.w,
                                                bottom: 2.h),
                                            controller: scrollController,
                                            itemCount: chatModel.length,
                                            itemBuilder: (context, index) {
                                              ChatModel comments =
                                                  chatModel[index];

                                              return Consumer<
                                                  MainDashboardController>(
                                                builder:
                                                    (context, value, child) =>
                                                        bubbleChat(
                                                  context: context,
                                                  p2: p2,
                                                  isMe: comments.senderemail ==
                                                          value.userDetails!
                                                              .email
                                                      ? true
                                                      : false,
                                                  chatModel: comments,
                                                  listMessage: chatModel,
                                                  index: index,
                                                ),
                                              );
                                            });
                                      }

                                      return const SizedBox();
                                    }))),
                      ),
                      Consumer<ChatroomControlller>(
                          builder: (context, value, child) =>
                              value.currentStatus == "Close"
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 20.h),
                                      child: ReopenButton(
                                          idTask: widget.taskModel.id!),
                                    )
                                  : KeyboardWidget(
                                      task: widget.taskModel,
                                    ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
