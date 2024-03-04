import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../const.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    Key? key,
    required this.label,
    required this.callback,
    required this.icon,
    this.isEmpty = false,
    this.funtion,
  }) : super(key: key);

  final String label;
  final VoidCallback callback;
  final VoidCallback? funtion;
  final IconData icon;
  final bool? isEmpty;

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
            color: Colors.grey.shade300,
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
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal),
              ),
              isEmpty! == false
                  ? InkWell(
                      onTap: funtion ?? () {},
                      child: Icon(
                        Icons.cancel,
                        color: mainColor2,
                        size: 25.sp,
                      ),
                    )
                  : Icon(
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
