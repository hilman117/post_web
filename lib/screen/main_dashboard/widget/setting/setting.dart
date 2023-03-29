import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/row_title/widget/loading_widget.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/about_title/title.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/about_departement/all_departments_registered.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/about_location/location.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';
import '../../../../models/departement.dart';
import '../../../../models/user.dart';
import 'widget/about_employee_account/employee_account_list.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataDepartement = Provider.of<List<Departement>>(context);
    var dataUser = Provider.of<List<UserDetails>>(context);
    return Consumer<SettingsController>(
        builder: (context, value, child) => Stack(
              children: [
                Container(
                  color: const Color(0xffF9F7FF),
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 50.w, top: 20.h),
                        child: Text(
                          "Admin",
                          style: style24SemiBold,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 40.w),
                        height: 1200.h,
                        child: StaggeredGrid.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: 20.h,
                          crossAxisSpacing: 20.w,
                          children: const [
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 1.3,
                              child: AllDepartmentRegistered(),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 1.3,
                              child: EmployeeAccountList(),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 1.3,
                              child: TitleSettings(),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 1.3,
                              child: AllLocation(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                    ],
                  ),
                ),
                if (dataUser.isEmpty && dataDepartement.isEmpty) loadingWidget()
              ],
            ));
  }
}
