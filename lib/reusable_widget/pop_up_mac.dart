import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopUpMac extends StatelessWidget {
  const PopUpMac({
    Key? key,
    required this.listItem,
    this.width,
    this.maxHeight,
  }) : super(key: key);

  final List<Widget> listItem;
  final double? width;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 400.h),
      child: AnimatedContainer(
        // height: maxHeight,
        duration: const Duration(milliseconds: 500),
        width: width ?? 350.w,
        padding: EdgeInsets.all(1.sp),
        decoration: BoxDecoration(
            color: const Color(0xff6E6D70),
            borderRadius: BorderRadius.circular(8)),
        child: Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.w),
              color: const Color(0xff6E6D70),
              borderRadius: BorderRadius.circular(8)),
          child: SingleChildScrollView(
              child:
                  Column(mainAxisSize: MainAxisSize.min, children: listItem)),
        ),
      ),
    );
  }
}
