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
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            width: 250.w,
            decoration: BoxDecoration(
              color: isHover ? theme.hoverColor : Colors.transparent,
              border: Border(
                  left: widget.index == 0
                      ? BorderSide.none
                      : BorderSide(color: theme.canvasColor, width: 0.5.w),
                  right: BorderSide(
                      color: widget.index == widget.departements.length
                          ? Colors.transparent
                          : theme.canvasColor,
                      width: 0.25.w)),
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
                        widget.icon,
                        width: 25.w,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      SizedBox(
                        width: 150.w,
                        child: Text(
                          widget.buttonName,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: value.selectedDepartment == widget.index
                                ? Colors.green
                                : theme.canvasColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.totalRequest.toString(),
                        style: TextStyle(
                            fontSize: 30.sp,
                            color: value.selectedDepartment == widget.index
                                ? Colors.green
                                : theme.canvasColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      if (widget.newStatus != 0)
                        Transform.scale(
                          scale: 0.5,
                          child: Chip(
                              backgroundColor: Colors.red,
                              label: Text(
                                "New  ${widget.newStatus.toString()}",
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.white),
                              )),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
