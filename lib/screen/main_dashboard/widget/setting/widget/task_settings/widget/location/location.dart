import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/employee_account/widget/search_field_setting.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

import '../../../../../dashboard/controller_dashboard.dart';

class AllLocation extends StatelessWidget {
  const AllLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
        builder: (context, value, child) => Container(
              alignment: Alignment.bottomCenter,
              width: 300.w,
              height: 300.h,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    // alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10.w, right: 20.w),
                    height: 50.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Locations",
                          style: style18Bold,
                        ),
                        const Spacer(),
                        const SearchFieldSettings()
                      ],
                    ),
                  ),
                  Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6))),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      height: 500.h,
                      child: ListView.builder(
                        itemCount: value.locations.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: 170.w,
                                  child: Text(
                                    value.locations[index],
                                    style: style18Normal,
                                  ),
                                ),
                                const Spacer(),
                                Material(
                                  color: Colors.transparent,
                                  child: IconButton(
                                      splashColor: Colors.grey,
                                      splashRadius: 15.sp,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.delete_outlined,
                                        size: 25.sp,
                                        color: Colors.grey,
                                      )),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: IconButton(
                                      splashColor: Colors.blue,
                                      splashRadius: 15.sp,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit,
                                        size: 25.sp,
                                        color: Colors.blue,
                                      )),
                                ),
                              ],
                            ),
                            const Divider()
                          ],
                        ),
                      )),
                ],
              ),
            ));
  }
}
