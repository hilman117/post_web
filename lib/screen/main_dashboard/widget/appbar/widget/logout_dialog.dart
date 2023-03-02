import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:post_web/other.dart';
import 'package:post_web/screen/landing_page/landing_page.dart';
import 'package:post_web/reusable_widget/no_button.dart';
import 'package:post_web/reusable_widget/yes_button.dart';

logoutDialog(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final auth = FirebaseAuth.instance;
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
                borderRadius: BorderRadius.circular(10), color: Colors.white),
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
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: p1.maxHeight * 0.2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NoButton(
                        p2: p1,
                        callback: () => Navigator.of(context).pop(),
                      ),
                      YesButton(
                        p2: p1,
                        nameButton: "Yes",
                        callback: () async {
                          Navigator.of(context).pop();
                          await auth.signOut();
                          Get.to(() => const LandingPage());
                        },
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
