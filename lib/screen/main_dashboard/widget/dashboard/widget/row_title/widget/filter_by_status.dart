import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:provider/provider.dart';

import '../../../controller_dashboard.dart';

Widget filterByStatus(
    {required BuildContext context,
    required String status,
    required int index}) {
  final theme = Theme.of(context);
  return Consumer<DashboardController>(
    builder: (context, value, child) => Container(
      alignment: Alignment.center,
      width: 100.w,
      margin: const EdgeInsets.symmetric(horizontal: 1.25, vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: value.statusSelected == index
              ? mainColor2.withOpacity(0.5)
              : theme.primaryColor),
      child: Text(
        status,
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 15.sp,
            color: value.statusSelected == index
                ? Colors.white
                : theme.canvasColor),
      ),
    ),
  );
}
