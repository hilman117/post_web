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
    final theme = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: callback,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          height: 40.h,
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(8.r),
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
