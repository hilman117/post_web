import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotifActionResult extends StatelessWidget {
  const NotifActionResult({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.black54),
      child: Text(
        text,
        style: TextStyle(fontSize: 15.sp, color: Colors.white),
      ),
    );
  }
}
