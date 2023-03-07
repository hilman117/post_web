import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:post_web/other.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../firebase/firebase_account.dart';

deletePopUp(BuildContext context, String name, String email) {
  final controller = Provider.of<FirebaseAccount>(context, listen: false);
  return showDialog(
    context: context,
    builder: (context) => Consumer<FirebaseAccount>(
      builder: (context, value, child) => value.isSuccessDelete != true
          ? AlertDialog(
              content:
                  Consumer<FirebaseAccount>(builder: (context, value, child) {
                if (value.isLoadingDelete) {
                  return const CircularProgressIndicator.adaptive();
                }
                return Container(
                  // height: 150.h,
                  // width: 500.w,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                          text: TextSpan(style: style18Normal, children: [
                        const TextSpan(text: "Are you sure want to remove "),
                        TextSpan(
                            text: name,
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold)),
                        const TextSpan(text: " from your team?")
                      ])),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                );
              }),
              actions: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    alignment: Alignment.center,
                    width: 100.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.sarabun(
                          fontSize: 18.sp, color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => controller.deleteAccount(context, email),
                  child: Container(
                    alignment: Alignment.center,
                    width: 100.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                    color: mainColor2,
                    child: Text(
                      "Yes",
                      style: GoogleFonts.sarabun(
                          fontSize: 18.sp, color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          : AlertDialog(
              content: LimitedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset("image/deleted.json",
                      width: 100.w, height: 100.h),
                  Text(
                    "Deleted success",
                    style: style18Normal,
                  )
                ],
              ),
            )),
    ),
  );
}
