import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:post_web/style.dart';

class TableTitle extends StatelessWidget {
  const TableTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: 280.w,
          child: Text("Sender", style: style20Normal),
        ),
        Container(
          alignment: Alignment.center,
          width: 70.w,
          child: Text("To", style: style20Normal),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: 200.w,
          child: Text("Location", style: style20Normal),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: 200.w,
          child: Text("Title", style: style20Normal),
        ),
        Container(
          alignment: Alignment.center,
          width: 200.w,
          child: Text("Description", style: style20Normal),
        ),
        Container(
          alignment: Alignment.center,
          width: 200.w,
          child: Text("Status", style: style20Normal),
        ),
        Container(
          alignment: Alignment.center,
          width: 230.w,
          child: Text("Receiver", style: style20Normal),
        ),
        Container(
          alignment: Alignment.center,
          width: 200.w,
          child: Text("Action", style: style20Normal),
        ),
        Container(
          alignment: Alignment.center,
          width: 200.w,
          child: Text("Time", style: style20Normal),
        ),
      ],
    );
  }
}
