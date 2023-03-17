import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopUpSenderProfile extends StatelessWidget {
  const PopUpSenderProfile({Key? key, required this.imageUrl})
      : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.topCenter,
        height: 600.h,
        width: 400.w,
        color: Colors.white,
        child: SizedBox(
          height: 300.h,
          width: 400.w,
          child: Image.network(imageUrl),
        ),
      ),
    );
  }
}
