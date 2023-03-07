import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/firebase/firebase_action_task.dart';
import 'package:post_web/const.dart';
import 'package:post_web/reusable_widget/no_button.dart';
import 'package:post_web/reusable_widget/texfield.dart';
import 'package:post_web/reusable_widget/yes_button.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

closeTaskDialog(BuildContext context, String idTask) {
  final ctrl = Provider.of<FirebaseActionTask>(context, listen: false);
  final TextEditingController commentBody = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Container(
              width: 500.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Are you sure want to close this request?",
                    style: style18Normal,
                  ),
                  TexfieldWidget(
                    controller: commentBody,
                    height: 50.h,
                    bgCOlor: mainColor2.withOpacity(0.2),
                    hintText: "Decription",
                    width: 490.w,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 45.h,
                        child: NoButton(
                          width: 150.w,
                          callback: () => Navigator.of(context).pop(),
                        ),
                      ),
                      SizedBox(
                        height: 45.h,
                        child: YesButton(
                            width: 150.w,
                            nameButton: "Yes",
                            callback: () {
                              ctrl.closeTask(context, idTask, commentBody);
                              Navigator.pop(context);
                            }),
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
}
