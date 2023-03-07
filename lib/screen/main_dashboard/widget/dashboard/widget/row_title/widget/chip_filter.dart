import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../other.dart';
import '../../../controller_dashboard.dart';

class ChipFilter extends StatelessWidget {
  const ChipFilter({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
        builder: (context, value, child) => FittedBox(
              child: Container(
                // width: 200.w,
                padding: EdgeInsets.all(5.sp),
                decoration: BoxDecoration(
                    border: Border.all(color: mainColor2.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                  children: [
                    Text(
                      value.selectedDepartment >= 0
                          ? value.department
                          : "All Departement",
                      style: TextStyle(fontSize: 18.sp, color: Colors.black54),
                      overflow: TextOverflow.clip,
                    ),
                    value.selectedDepartment >= 0 || value.statusSelected >= 0
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: InkWell(
                              onTap: () => controller.clearFilter(),
                              child: Icon(
                                Icons.cancel_outlined,
                                size: 20.sp,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ));
  }
}
