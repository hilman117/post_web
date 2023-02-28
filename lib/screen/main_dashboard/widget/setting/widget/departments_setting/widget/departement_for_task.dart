import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../style.dart';
import '../../../controller_settings.dart';

class DepartementForTask extends StatelessWidget {
  const DepartementForTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
        builder: (context, value, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Departement Task Receiver",
                  style: style18Bold,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  // margin: EdgeInsets.only(left: 100.w),
                  alignment: Alignment.bottomCenter,
                  // width: 500.w,
                  height: 500.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        // alignment: Alignment.centerLeft,
                        // color: mainColor2.withOpacity(0.2),
                        padding: EdgeInsets.only(left: 10.w, right: 50.w),
                        height: 50.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              "Departments",
                              style: style18Normal,
                            ),
                            const Spacer(),
                            Text(
                              "Remove",
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(7),
                                bottomRight: Radius.circular(7)),
                          ),

                          width: double.infinity,
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          // height: 170.h,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                  value.departments.length,
                                  (index) => Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 30.w),
                                                alignment: Alignment.centerLeft,
                                                width: 120.w,
                                                // height: 20.h,
                                                child: Text(
                                                  value.departments[index],
                                                  style: style18Normal,
                                                ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: 50.w),
                                                width: 40.w,
                                                child: Tooltip(
                                                  message: "Delete",
                                                  child: Material(
                                                      color: Colors.transparent,
                                                      child: InkWell(
                                                        onTap: () {},
                                                        child: Image.asset(
                                                          "image/Trash.png",
                                                          width: 20.w,
                                                          height: 20.h,
                                                        ),
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Divider()
                                        ],
                                      )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
  }
}
