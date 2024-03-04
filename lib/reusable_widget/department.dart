import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/models/departement.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';

import 'package:provider/provider.dart';

class Department extends StatefulWidget {
  const Department({
    Key? key,
    required this.buttonName,
    required this.callback,
    required this.index,
    required this.color,
    required this.totalRequest,
    required this.icon,
    required this.departements,
    this.newStatus,
  }) : super(key: key);

  final String buttonName;
  final String icon;
  final int index;
  final VoidCallback callback;
  final Iterable<Departement> departements;
  final int totalRequest;
  final int? newStatus;
  final Color color;

  @override
  State<Department> createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<DashboardController>(builder: (context, value, child) {
      return InkWell(
        onTap: widget.callback,
        child: MouseRegion(
          onEnter: (event) {
            setState(() {
              isHover = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHover = false;
            });
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            margin: EdgeInsets.all(10.sp),
            width: 300.w,
            height: 80.h,
            decoration: BoxDecoration(
                color: isHover ? theme.hoverColor : theme.cardColor,
                borderRadius: BorderRadius.circular(20.r)),
            child: Stack(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xffE8EEF8),
                      radius: 30.r,
                      child: Image.asset(
                        widget.icon,
                        width: 27.w,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120.w,
                          child: Text(
                            widget.buttonName,
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: widget.color,
                                fontWeight: FontWeight.normal),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          widget.totalRequest.toString(),
                          style: TextStyle(
                              fontSize: 30.sp,
                              color: widget.color,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                if (widget.newStatus != null && widget.newStatus != 0)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform.scale(
                        scale: 1.sp,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Text(
                            "${widget.newStatus}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
