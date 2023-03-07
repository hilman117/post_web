import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/send_more_button.dart';
import 'widget/texfield.dart';

Widget keyboardChat(
    {required BuildContext context,
    required BoxConstraints p1,
    required String idTask,
    required ScrollController scrollController}) {
  TextEditingController commentText = TextEditingController();
  return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: p1.maxWidth * 0.03, left: 5.w),
      width: p1.maxWidth,
      child: LayoutBuilder(
        builder: (p0, p2) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFieldArea(
              p1: p2,
              commentText: commentText,
            ),
            SendAndMoreButton(
              p1: p1,
              commentText: commentText,
              idTask: idTask,
              scrollController: scrollController,
            )
          ],
        ),
      ));
}
