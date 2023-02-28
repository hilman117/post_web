import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/other.dart';

import 'package:post_web/style.dart';

class YourAccountDetail extends StatelessWidget {
  const YourAccountDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Get.put(CUser());
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 1200.w,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 250.w,
                    child: Text(
                      "Profile Photo",
                      style: style22Bold,
                    ),
                  ),
                  Container(
                    width: 70.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                            image: NetworkImage(user.data.profileImage!),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Remove",
                          style:
                              TextStyle(fontSize: 22.sp, color: Colors.black54),
                        )),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Update",
                        style: TextStyle(fontSize: 22.sp, color: mainColor2),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            SizedBox(
              width: 1200.w,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 250.w,
                    child: Text(
                      "Name",
                      style: style22Bold,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 70.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade400)),
                      child: SelectableText(
                        user.data.name!,
                        style: style22Normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            SizedBox(
              width: 1200.w,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 250.w,
                    child: Text(
                      "Position",
                      style: style22Bold,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 70.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade400)),
                      child: SelectableText(
                        user.data.position!,
                        style: style22Normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            SizedBox(
              width: 1200.w,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 250.w,
                    child: Text(
                      "Email Account",
                      style: style22Bold,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 70.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade400)),
                      child: Text(
                        user.data.email!,
                        style: style22Normal,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 150.w,
                    child: Text(
                      "Account type",
                      style: style22Bold,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 70.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade400)),
                      child: Text(
                        user.data.accountType!,
                        style: style22Normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
