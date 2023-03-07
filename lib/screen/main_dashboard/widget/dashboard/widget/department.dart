import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';

import 'package:provider/provider.dart';

class Department extends StatelessWidget {
  const Department({
    Key? key,
    required this.buttonName,
    required this.callback,
    required this.p1,
    required this.index,
    required this.color,
    required this.totalRequest,
    required this.icon,
  }) : super(key: key);

  final String buttonName;
  final String icon;
  final int index;
  final VoidCallback callback;
  final BoxConstraints p1;
  final int totalRequest;
  final Color color;

  @override
  Widget build(BuildContext context) => Consumer<DashboardController>(
        builder: (context, value, child) => InkWell(
          onTap: callback,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            width: 250.w,
            // margin: EdgeInsets.symmetric(horizontal: p1.maxWidth * 0.015),
            decoration: BoxDecoration(
              color: value.departementHoveringIndex == index
                  ? Colors.grey.shade200
                  : Colors.transparent,
              border: Border(
                  left: index == 0
                      ? BorderSide.none
                      : BorderSide(color: Colors.black87, width: 0.5.w),
                  right: index == value.departments.length - 1
                      ? BorderSide.none
                      : BorderSide(color: Colors.black87, width: 0.5.w)),

              // borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        icon,
                        width: 25.w,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      SizedBox(
                        width: 150.w,
                        child: Text(
                          buttonName,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: value.selectedDepartment == index
                                ? Colors.green
                                : Colors.black54,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    totalRequest.toString(),
                    style: TextStyle(
                        fontSize: 30.sp,
                        color: value.selectedDepartment == index
                            ? Colors.green
                            : Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
