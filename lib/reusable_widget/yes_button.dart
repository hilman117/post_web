import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';

class YesButton extends StatelessWidget {
  const YesButton({
    Key? key,
    this.width,
    required this.nameButton,
    required this.callback,
    this.icon,
  }) : super(key: key);
  final double? width;
  final String nameButton;
  final VoidCallback callback;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      width: width ?? 150.w,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: mainColor2,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: callback,
          child: Row(
            mainAxisAlignment: icon != null
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.center,
            children: [
              icon != null
                  ? Icon(
                      icon,
                      size: 20.sp,
                    )
                  : const SizedBox(),
              Text(
                nameButton,
                style: TextStyle(fontSize: 20.sp),
              )
            ],
          )),
    );
  }
}
