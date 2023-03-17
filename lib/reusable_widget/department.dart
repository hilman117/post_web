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
  }) : super(key: key);

  final String buttonName;
  final String icon;
  final int index;
  final VoidCallback callback;
  final Iterable<Departement> departements;
  final int totalRequest;
  final Color color;

  @override
  State<Department> createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) => Consumer<DashboardController>(
        builder: (context, value, child) => InkWell(
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
              // margin: EdgeInsets.symmetric(horizontal: p1.maxWidth * 0.015),
              decoration: BoxDecoration(
                color: isHover ? Colors.grey.shade200 : Colors.transparent,
                border: Border(
                    left: widget.index == 0
                        ? BorderSide.none
                        : BorderSide(color: Colors.black87, width: 0.5.w),
                    right: widget.index != widget.departements.length
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
                                  : Colors.black54,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.totalRequest.toString(),
                      style: TextStyle(
                          fontSize: 30.sp,
                          color: value.selectedDepartment == widget.index
                              ? Colors.green
                              : Colors.black54,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
