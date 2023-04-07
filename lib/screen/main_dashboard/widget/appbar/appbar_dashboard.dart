import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:post_web/controller/c_user.dart';

import 'package:post_web/custom_react_twin.dart';
import 'package:post_web/hero_dialog_route.dart';
import 'package:post_web/const.dart';
import 'package:post_web/notif.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';

import 'package:post_web/reusable_widget/photo_profile_network.dart';
import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
import 'package:provider/provider.dart';

import '../../../../models/departement.dart';
import '../../../../models/task.dart';
import '../profile_view/profile_view.dart';

Widget appbarDashboard(BuildContext context) {
  var requestData = Provider.of<List<TaskModel>>(context);
  var data = Provider.of<List<Departement>>(context);
  final event = Provider.of<ReportController>(context, listen: false);
  final user = Get.put(CUser());
  final size = MediaQuery.of(context).size;
  final mainDashboardController =
      Provider.of<MainDashboardController>(context, listen: false);
  final theme = Theme.of(context);
  return Consumer<MainDashboardController>(
    builder: (context, value, child) => Container(
        decoration:
            BoxDecoration(color: theme.appBarTheme.backgroundColor, boxShadow: [
          BoxShadow(
              color: theme.canvasColor,
              blurRadius: 0.5,
              offset: const Offset(1.0, 0.1))
        ]),
        alignment: Alignment.center,
        height: size.height * 0.09,
        width: double.infinity,
        child: LayoutBuilder(
          builder: (p0, p1) => Padding(
            padding: EdgeInsets.symmetric(horizontal: p1.maxWidth * 0.020),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  user.data.hotel!,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: theme.canvasColor),
                ),
                SizedBox(
                  width: 50.w,
                ),
                SizedBox(
                  width: 700.w,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.menuDashboard.length,
                      itemBuilder: (context, index) => Container(
                            alignment: Alignment.center,
                            height: size.height * 0.09,
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: MouseRegion(
                              onEnter: (event) =>
                                  mainDashboardController.hoveringMenu(index),
                              onExit: (event) =>
                                  mainDashboardController.hoveringMenu(-1),
                              child: InkWell(
                                onTap: () async {
                                  await mainDashboardController
                                      .selectMenu(index);
                                  if (value.menuSelected == 1) {
                                    var listDepartement = data
                                        .where((element) =>
                                            element.isActive == true)
                                        .toList();
                                    event.getResultMostWidelyTitle(
                                        requestData, listDepartement);
                                  }
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: (value.menuHovering ==
                                                          index ||
                                                      value.menuSelected ==
                                                          index)
                                                  ? mainColor2
                                                  : Colors.transparent))),
                                  child: Row(
                                    children: [
                                      Icon(
                                        value.iconMenu[index],
                                        color: (value.menuHovering == index ||
                                                value.menuSelected == index)
                                            ? mainColor2
                                            : theme.canvasColor,
                                        size: 25.sp,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        value.menuDashboard[index],
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: (value.menuHovering ==
                                                        index ||
                                                    value.menuSelected == index)
                                                ? mainColor2
                                                : theme.canvasColor,
                                            fontWeight:
                                                value.menuSelected == index
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.data.name!,
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: theme.canvasColor),
                    ),
                    Text(
                      user.data.position!,
                      style:
                          TextStyle(fontSize: 18.sp, color: theme.canvasColor),
                    )
                  ],
                ),
                SizedBox(width: p1.maxWidth * 0.005),
                GestureDetector(
                  onTap: () {
                    Future.delayed(
                      const Duration(milliseconds: 300),
                      () => mainDashboardController.openProfileView(),
                    );
                    Navigator.of(context).push(HeroDialogRoute(
                      builder: (context) => Hero(
                        createRectTween: (begin, end) {
                          return CustomRectTween(begin: begin!, end: end!);
                        },
                        tag: "profileView1",
                        child: Center(child: ProfileView(p1: p1)),
                      ),
                    ));
                  },
                  child: Hero(
                    tag: "profileView1",
                    createRectTween: (begin, end) {
                      Future.delayed(
                        const Duration(milliseconds: 300),
                        () => mainDashboardController.openProfileView(),
                      );
                      return RectTween(
                          begin: Rect.fromCenter(
                              center: const Offset(600, 600),
                              width: 100,
                              height: 100),
                          end: Rect.fromCenter(
                              center: const Offset(1200, 20),
                              width: 0,
                              height: 0));
                    },
                    child: SizedBox(
                      child: PhotoProfileNetWork(
                          lebar: p1.maxWidth * 0.015,
                          tinggi: p1.maxWidth * 0.015,
                          radius: p1.maxWidth * 0.015,
                          urlImage: user.data.profileImage!),
                    ),
                  ),
                ),
                SizedBox(width: p1.maxWidth * 0.01),
                InkWell(
                  onTap: () => mainDashboardController.changeThemeMode(),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 1000),
                    child: value.isDarkMode
                        ? const Icon(Icons.light_mode)
                        : Icon(Icons.dark_mode_outlined,
                            color: theme.iconTheme.color),
                  ),
                ),
                SizedBox(width: p1.maxWidth * 0.01),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () => Notif().sendNotifToToken(
                      "d-dq5CARF_hh7IRTKsCXgE:APA91bExlLGxzby2ZaZM7bzH-wOrNgeOXqMnq1H6dnfR7oMhV5GeRvRNjEGQEAlw4mazYem5d9cIOOnJgUPvXHTqCjVF-h57UIn8ryx92se1uu72V2gQT2yO9wb3gh9QQbdRlGh-gwdX",
                      "ini title",
                      "ini bodi",
                      ""),
                  // () => logoutDialog(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout_rounded,
                        color: theme.iconTheme.color,
                      ),
                      Text(
                        "logout",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: theme.iconTheme.color,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
  );
}
