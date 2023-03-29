import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/const.dart';

Widget statusWidget(
    {required BuildContext context,
    required String status,
    double? width,
    double? fontSize,
    double? horizontalPadding,
    double? verticalPadding}) {
  return Container(
    alignment: Alignment.center,
    width: width ?? 100.w,
    padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 3.w, vertical: verticalPadding ?? 3.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: (status == 'To Do')
          ? Colors.red.shade50
          : (status == 'New')
              ? Colors.red.shade50
              : (status == 'Accepted')
                  ? Colors.green.shade50
                  : (status == 'Resume')
                      ? mainColor2.withOpacity(0.2)
                      : (status == 'ESC')
                          ? Colors.orange.shade100
                          : (status == 'Close')
                              ? Colors.grey.shade300
                              : (status == 'Hold')
                                  ? Colors.grey.shade200
                                  : (status == 'Assigned')
                                      ? Colors.blue.shade50
                                      : Colors.blue.shade50,
    ),
    child: Text(
      status,
      style: GoogleFonts.sarabun(
        fontSize: fontSize ?? 18.sp,
        fontWeight: FontWeight.w600,
        color: (status == 'To Do')
            ? Colors.red.shade600
            : (status == 'New')
                ? Colors.red.shade600
                : (status == 'Accepted')
                    ? Colors.green.shade600
                    : (status == 'Resume')
                        ? mainColor2
                        : (status == 'ESC')
                            ? Colors.orange.shade900
                            : (status == 'Close' || status == 'Claimed')
                                ? Colors.grey.shade500
                                : (status == 'Hold')
                                    ? Colors.grey
                                    : (status == 'Assigned' ||
                                            status == 'Released')
                                        ? Colors.blue.shade900
                                        : Colors.blue.shade600,
      ),
    ),
  );
}
