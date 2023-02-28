import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/employee_account/widget/search_field_setting.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

class TitleList extends StatelessWidget {
  const TitleList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
        builder: (context, value, child) => Container(
              alignment: Alignment.bottomCenter,
              // width: 300,
              height: 500.h,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Container(
                    // alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10.w, right: 20.w),
                    height: 50.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Title",
                          style: style18Bold,
                        ),
                        const Spacer(),
                        const SearchFieldSettings()
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6))),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        // height: 400.h,
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
                                        splashRadius: 15,
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
                                        splashRadius: 15,
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.edit,
                                          size: 15,
                                          color: Colors.blue,
                                        )),
                                  ),
                                ],
                              ),
                              const Divider()
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ));
  }
}
