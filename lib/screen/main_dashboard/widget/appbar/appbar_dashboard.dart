// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:popover/popover.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/reusable_widget/show_dialog.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:provider/provider.dart';
import 'widget/logout_dialog.dart';

Widget appbarDashboard(BuildContext context) {
  final event = Provider.of<MainDashboardController>(context, listen: false);

  final user = Get.put(CUser());
  final size = MediaQuery.of(context).size;
  final theme = Theme.of(context);
  return Consumer2<MainDashboardController, DashboardController>(
    builder: (context, value, value2, child) => Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
        ),
        alignment: Alignment.center,
        height: size.height * 0.09,
        width: double.infinity,
        child: LayoutBuilder(builder: (p0, p1) {
          return Padding(
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
                      itemBuilder: (context, index) {
                        if (index == 0 &&
                            user.data.department == "Housekeeping") {
                          return MouseRegion(
                            onEnter: (pointer) => event.hoveringMenu(index),
                            onExit: (pointer) => event.hoveringMenu(-1),
                            child: InkWell(
                              onTap: () => event.selectMenu(
                                  index, value.menuDashboard[index]),
                              child: Container(
                                  alignment: Alignment.center,
                                  height: size.height * 0.09,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: value.menuWidget(context, index)),
                            ),
                          );
                        }
                        if (index == 0 &&
                            user.data.department == "Engineering") {
                          return MouseRegion(
                            onEnter: (pointer) => event.hoveringMenu(index),
                            onExit: (pointer) => event.hoveringMenu(-1),
                            child: InkWell(
                              onTap: () => event.selectMenu(
                                  index, value.menuDashboard[index]),
                              child: Container(
                                  alignment: Alignment.center,
                                  height: size.height * 0.09,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: value.menuWidget(context, index)),
                            ),
                          );
                        }
                        if (index == 0 &&
                            user.data.accountType == "Administrator") {
                          return MouseRegion(
                            onEnter: (pointer) => event.hoveringMenu(index),
                            onExit: (pointer) => event.hoveringMenu(-1),
                            child: InkWell(
                              onTap: () => event.selectMenu(
                                  index, value.menuDashboard[index]),
                              child: Container(
                                  alignment: Alignment.center,
                                  height: size.height * 0.09,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: value.menuWidget(context, index)),
                            ),
                          );
                        }
                        if (index == 1 &&
                            user.data.accountType == "Administrator") {
                          return MouseRegion(
                            onEnter: (pointer) => event.hoveringMenu(index),
                            onExit: (pointer) => event.hoveringMenu(-1),
                            child: InkWell(
                              onTap: () => event.selectMenu(
                                  index, value.menuDashboard[index]),
                              child: Container(
                                  alignment: Alignment.center,
                                  height: size.height * 0.09,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: value.menuWidget(context, index)),
                            ),
                          );
                        }
                        if (index == 2 &&
                            user.data.department == "Housekeeping") {
                          return MouseRegion(
                            onEnter: (pointer) => event.hoveringMenu(index),
                            onExit: (pointer) => event.hoveringMenu(-1),
                            child: InkWell(
                              onTap: () => event.selectMenu(
                                  index, value.menuDashboard[index]),
                              child: Container(
                                  alignment: Alignment.center,
                                  height: size.height * 0.09,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: value.menuWidget(context, index)),
                            ),
                          );
                        }
                        if (index == 3 &&
                            user.data.department == "Housekeeping") {
                          return MouseRegion(
                            onEnter: (pointer) => event.hoveringMenu(index),
                            onExit: (pointer) => event.hoveringMenu(-1),
                            child: InkWell(
                              onTap: () async {
                                // ShowDialog().loadingDialog(context);
                                await event.selectMenu(
                                    index, value.menuDashboard[index]);
                                // var listDepartement = data
                                //     .where(
                                //         (element) => element.isActive == true)
                                //     .toList();
                                // await eventDashboard.getHistoryTask();
                                // await eventReport.getResultMostWidelyTitle(
                                //     value2.allTaskData, listDepartement);
                                // await eventReport.getMost10CreatorRequest(
                                //     dataEmployees, value2.allTaskData);
                                // await eventReport.dailyChartData(
                                //     value2.allTaskData, listDepartement);
                                // await eventReport.getPopularTitle(
                                //     value2.allTaskData, listDepartement);
                                // await eventReport.getPopularLocation(
                                //     value2.allTaskData, value.data!);
                                // eventReport.getTopReceiver(
                                //     value2.allTaskData, dataEmployees);
                                // // ignore: use_build_context_synchronously
                                // Navigator.of(context).pop();
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: size.height * 0.09,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: value.menuWidget(context, index)),
                            ),
                          );
                        }
                        if (index == 3 &&
                            user.data.department == "Engineering") {
                          return MouseRegion(
                            onEnter: (pointer) => event.hoveringMenu(index),
                            onExit: (pointer) => event.hoveringMenu(-1),
                            child: InkWell(
                              onTap: () async {
                                ShowDialog().loadingDialog(context);
                                await event.selectMenu(
                                    index, value.menuDashboard[index]);
                                // var listDepartement = data
                                //     .where(
                                //         (element) => element.isActive == true)
                                //     .toList();
                                // // ignore: use_build_context_synchronously
                                // await value2.getHistoryTask();
                                // await eventReport.getResultMostWidelyTitle(
                                //     value2.allTaskData, listDepartement);
                                // await eventReport.getMost10CreatorRequest(
                                //     context, value2.allTaskData);
                                // await eventReport.dailyChartData(
                                //     value2.allTaskData, listDepartement);
                                // await eventReport.getPopularTitle(
                                //     value2.allTaskData, listDepartement);
                                // await eventReport.getPopularLocation(
                                //     value2.allTaskData, value.data!);
                                // eventReport.getTopReceiver(
                                //     value2.allTaskData, dataEmployees);
                                // // ignore: use_build_context_synchronously
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: size.height * 0.09,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: value.menuWidget(context, index)),
                            ),
                          );
                        }
                        if (index == 3 &&
                            user.data.accountType == "Administrator") {
                          return MouseRegion(
                            onEnter: (pointer) => event.hoveringMenu(index),
                            onExit: (pointer) => event.hoveringMenu(-1),
                            child: InkWell(
                              onTap: () async {
                                ShowDialog().loadingDialog(context);
                                await event.selectMenu(
                                    index, value.menuDashboard[index]);
                                // var listDepartement = data
                                //     .where(
                                //         (element) => element.isActive == true)
                                //     .toList();
                                // // ignore: use_build_context_synchronously
                                // await eventDashboard.getHistoryTask();
                                // await eventDashboard
                                //     .getAllTask()
                                //     .then((val) async {
                                //   await eventReport.getResultMostWidelyTitle(
                                //       val, listDepartement);
                                //   // ignore: use_build_context_synchronously
                                //   eventReport.getMost10CreatorRequest(
                                //       context, val);
                                //   await eventReport.dailyChartData(
                                //       val, listDepartement);
                                //   await eventReport.getPopularTitle(
                                //       val, listDepartement);
                                //   await eventReport.getPopularLocation(
                                //       val, value.data!);
                                //   eventReport.getTopReceiver(
                                //       val, dataEmployees);
                                // });

                                // // ignore: use_build_context_synchronously
                                // Navigator.of(context).pop();
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: size.height * 0.09,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: value.menuWidget(context, index)),
                            ),
                          );
                        }
                        return const SizedBox();
                      }),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    showPopover(
                      context: context,
                      bodyBuilder: (context) => const Text("data"),
                      onPop: () => print('Popover was popped!'),
                      direction: PopoverDirection.bottom,
                      width: 200,
                      height: 400,
                      arrowHeight: 15.h,
                      arrowWidth: 30.w,
                    );
                  },
                  child: Column(
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
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: theme.canvasColor,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
                SizedBox(width: p1.maxWidth * 0.01),
                InkWell(
                  onTap: () => event.changeThemeMode(),
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
                  onTap: () => logoutDialog(context),
                  // onTap: () => value.dashboard(value.userDetails!.department!),
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
          );
        })),
  );
}
