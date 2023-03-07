import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoButton extends StatelessWidget {
  const NoButton({
    Key? key,
    required this.width,
    required this.callback,
    this.icon,
  }) : super(key: key);
  final double width;
  final VoidCallback callback;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
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
                      color: Colors.black54,
                    )
                  : const SizedBox(),
              Text(
                "Cancel",
                style: TextStyle(fontSize: 20.sp, color: Colors.black54),
              )
            ],
          )),
    );
  }
}
