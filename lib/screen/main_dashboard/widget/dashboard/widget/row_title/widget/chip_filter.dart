import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget chipFilter(BuildContext context, String text, bool showCancelButton,
    VoidCallback clearFunction) {
  final theme = Theme.of(context);
  return FittedBox(
    child: Container(
      // width: 200.w,
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
          border: Border.all(color: theme.canvasColor.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 18.sp,
                color: theme.canvasColor,
                fontWeight: FontWeight.normal),
            overflow: TextOverflow.clip,
          ),
          showCancelButton
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: InkWell(
                    onTap: clearFunction,
                    child: Icon(
                      Icons.cancel_outlined,
                      size: 20.sp,
                      color: theme.iconTheme.color,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    ),
  );
}
