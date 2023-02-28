import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/models/chat_model.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/other.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';
import '../../controller_dashboard.dart';
import '../row_title/widget/status_widget.dart';
import 'widget/bubble_chat/bubble_chat.dart';
import 'widget/keyboard/keyboard.dart';

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
    return Positioned(
      right: 20.w,
      bottom: 100.h,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          // alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              color: mainColor.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.sp),
                  topRight: Radius.circular(10.sp)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 2,
                    offset: const Offset(01, 01))
              ]),
          height: 900.h,
          width: 450.w,
          child: LayoutBuilder(
            builder: (p0, p1) => Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
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
                              "image/${widget.taskModel.sendTo}.png",
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
                          InkWell(
                            onTap: () {
                              controller.clearCardRequest();
                              controller.hideChatroom();
                            },
                            child: Icon(
                              Icons.close_rounded,
                              color: Colors.grey,
                              size: p1.maxWidth * 0.07,
                              shadows: const [
                                Shadow(
                                    offset: Offset(0.1, 0.1),
                                    color: Colors.grey,
                                    blurRadius: 2)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          StatusWidget(
                              width: 75.w,
                              fontSize: 13.sp,
                              verticalPadding: 1.h,
                              horizontalPadding: 2.w,
                              status: widget.taskModel.status!)
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SizedBox(
                              // alignment: Alignment.center,
                              width: p1.maxWidth,
                              child: StreamBuilder<DocumentSnapshot>(
                                  stream: streamChat,
                                  builder: (context, snapshot) =>
                                      LayoutBuilder(builder: (p0, p2) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.active) {
                                          var commentList =
                                              (snapshot.data!.data() as Map<
                                                  String,
                                                  dynamic>)['comment'] as List;

                                          // commentList.sort((a, b) =>
                                          //     b['time'].compareTo(a['time']));
                                          List<ChatModel> chatModel =
                                              commentList
                                                  .map((e) =>
                                                      ChatModel.fromJson(e))
                                                  .toList();
                                          return ListView.builder(
                                              // reverse: true,
                                              padding: const EdgeInsets.only(
                                                  bottom: 2),
                                              controller: scrollController,
                                              itemCount: chatModel.length,
                                              itemBuilder: (context, index) {
                                                ChatModel comments =
                                                    chatModel[index];

                                                return BubbleChat(
                                                  p2: p2,
                                                  isMe: comments.senderemail ==
                                                          user.data.email!
                                                      ? true
                                                      : false,
                                                  chatModel: comments,
                                                  listMessage: chatModel,
                                                  index: index,
                                                );
                                              });
                                        }

                                        return const SizedBox();
                                      }))),
                        ),
                        keyboardChat(context: context, p1: p1)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
