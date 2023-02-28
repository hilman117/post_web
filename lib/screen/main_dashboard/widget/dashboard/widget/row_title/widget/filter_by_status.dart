import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/other.dart';
import 'package:provider/provider.dart';

import '../../../controller_dashboard.dart';

class FilterByStatus extends StatelessWidget {
  const FilterByStatus({
    Key? key,
    required this.status,
    required this.index,
  }) : super(key: key);

  final String status;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
      builder: (context, value, child) => Container(
        alignment: Alignment.center,
        width: 100.w,
        margin: const EdgeInsets.symmetric(horizontal: 1.25, vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: value.statusSelected == index
                ? mainColor.withOpacity(0.5)
                : Colors.white),
        child: Text(
          status,
          style: TextStyle(
              fontSize: 15.sp,
              color: value.statusSelected == index
                  ? Colors.white
                  : Colors.black54),
        ),
      ),
    );
  }
}
