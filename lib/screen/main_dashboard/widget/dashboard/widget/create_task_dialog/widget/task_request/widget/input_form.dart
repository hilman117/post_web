import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../const.dart';
import '../../../../../../../../../style.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    Key? key,
    required this.label,
    required this.callback,
    required this.icon,
  }) : super(key: key);

  final String label;
  final VoidCallback callback;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: callback,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          height: 40.h,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 0.5,
                  spreadRadius: 0.5,
                  offset: const Offset(0.5, 0.5))
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: style18Normal,
              ),
              Icon(
                icon,
                color: mainColor2,
                size: 25.sp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
