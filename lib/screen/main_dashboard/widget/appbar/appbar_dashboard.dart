import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:post_web/controller/c_user.dart';

import 'package:post_web/custom_react_twin.dart';
import 'package:post_web/hero_dialog_route.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/appbar/widget/logout_dialog.dart';

import 'package:post_web/reusable_widget/photo_profile_network.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

import '../profile_view/profile_view.dart';

class AppbarDashboard extends StatelessWidget {
  const AppbarDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Get.put(CUser());
    final size = MediaQuery.of(context).size;
    final mainDashboardController =
        Provider.of<MainDashboardController>(context, listen: false);
    return Consumer<MainDashboardController>(
      builder: (context, value, child) => Container(
          decoration: const BoxDecoration(color: Color(0xffECECF1), boxShadow: [
            BoxShadow(blurRadius: 0.5, offset: Offset(1.0, 0.1))
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
                    style: style20Bold,
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
                                  onTap: () =>
                                      mainDashboardController.selectMenu(index),
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
                                              : Colors.black87,
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
                                                      value.menuSelected ==
                                                          index)
                                                  ? mainColor2
                                                  : Colors.black87,
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
                            fontSize: p1.maxWidth * 0.009,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        user.data.position!,
                        style: TextStyle(fontSize: p1.maxWidth * 0.009),
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
                          tag: "profileView",
                          child: Center(child: ProfileView(p1: p1)),
                        ),
                      ));
                    },
                    child: Hero(
                      tag: "profileView",
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
                    borderRadius: BorderRadius.circular(50),
                    onTap: () => logoutDialog(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.exit_to_app_outlined,
                          color: mainColor2,
                        ),
                        Text(
                          "logout",
                          style: style15Normal,
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
}
