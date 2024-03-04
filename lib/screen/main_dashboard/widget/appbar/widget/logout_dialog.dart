// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:post_web/const.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/reusable_widget/button.dart';
import 'package:post_web/reusable_widget/show_dialog.dart';
import 'package:post_web/screen/landing_page/landing_page.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:provider/provider.dart';

logoutDialog(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final auth = FirebaseAuth.instance;
  final theme = Theme.of(context);
  final event = Provider.of<DashboardController>(context, listen: false);
  final user = Get.put(CUser());
  return showDialog(
    barrierColor: Colors.black12,
    context: context,
    builder: (context) => CustomDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: FittedBox(
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            height: size.height * 0.2,
            width: size.width * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: theme.primaryColor),
            child: LayoutBuilder(
              builder: (p0, p1) => Column(
                children: [
                  Icon(
                    Icons.logout_outlined,
                    color: mainColor,
                    size: p1.maxWidth * 0.07,
                  ),
                  Text(
                    "Are you sure want to log out?",
                    style: TextStyle(
                        fontSize: p1.maxWidth * 0.035,
                        color: theme.canvasColor,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: p1.maxHeight * 0.2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 50.h,
                        child: ButtonCustom(
                            widht: 150.w,
                            fontSize: 20.sp,
                            isEnable: false,
                            buttonLabel: "Cancel",
                            onPressed: () => Navigator.of(context).pop()),
                      ),
                      SizedBox(
                        height: 50.h,
                        child: ButtonCustom(
                          widht: 150.w,
                          fontSize: 20.sp,
                          buttonLabel: "Yes",
                          onPressed: () async {
                            ShowDialog().loadingDialog(context);
                            await auth.signOut();
                            Navigator.of(context).pop();
                            Get.offAll(() => const LandingPage(),
                                transition: Transition.rightToLeft);
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    ),
  );
}
