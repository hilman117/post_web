import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:post_web/const.dart';
import 'package:post_web/style.dart';

class ShowDialog {
  Future alerDialog(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "Retry",
                style: style11Normal,
              ))
        ],
        title: Text(
          text,
          style: style20Normal,
        ),
      ),
    );
  }

  Future errorDialog(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "Retry",
                style: style11Normal,
              ))
        ],
        title: Text(
          text,
          style: style20Normal,
        ),
      ),
    );
  }

  Future loadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Center(
        child: Transform.scale(
          scale: 2.0,
          child: const CircularProgressIndicator.adaptive(
            backgroundColor: mainColor,
          ),
        ),
      ),
    );
  }

  Future succesDialog(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  "Ok!",
                  style: style15Normal,
                ))
          ],
          title: Column(
            children: [
              Lottie.asset("image/success.json", width: 100.w, height: 100.h),
              Text(
                text,
                style: style15Normal,
              )
            ],
          )),
    );
  }

  Future deleteSucces(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => Center(
                child: LimitedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset("image/deleted.json",
                      width: 100.w, height: 100.h),
                ],
              ),
            )));
  }
}
