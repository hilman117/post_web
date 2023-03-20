import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../reusable_widget/texfield.dart';
import 'widget/send_more_button.dart';

class KeyboardWidget extends StatelessWidget {
  const KeyboardWidget({
    Key? key,
    required this.idTask,
    required this.titleTask,
    required this.locationTask,
    required this.status,
  }) : super(key: key);

  final String idTask;
  final String titleTask;
  final String locationTask;
  final String status;
  static final TextEditingController commentText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<ChatroomControlller>(context, listen: false);
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 5.h, left: 5.w),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                // height: 40.h,
                child: TexfieldWidget(
                  // height: 40.h,
                  maxLines: 5,
                  hintText: "type here...",
                  bgCOlor: Colors.white,
                  fontHeight: 18.h,
                  controller: commentText,
                  searchFunction: (value) => event.typingTextToSend(value),
                )),
          ),
          SendAndMoreButton(
            commentText: commentText,
            idTask: idTask,
            locationTask: locationTask,
            titleTask: titleTask,
            status: status,
          )
        ],
      ),
    );
  }
}
