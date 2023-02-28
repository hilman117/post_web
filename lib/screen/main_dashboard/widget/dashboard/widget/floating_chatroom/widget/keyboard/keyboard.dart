import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/send_more_button.dart';
import 'widget/texfield.dart';

Widget keyboardChat(
    {required BuildContext context, required BoxConstraints p1}) {
  return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: p1.maxWidth * 0.03, left: 5.w),
      // height: MediaQuery.of(context).orientation == Orientation.landscape
      //     ? height * 0.08
      //     : height * 0.05,
      width: p1.maxWidth,
      child: LayoutBuilder(
        builder: (p0, p2) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFieldArea(
              p1: p2,
            ),
            SendAndMoreButton(
              p1: p1,
            )
          ],
        ),
      ));
}
