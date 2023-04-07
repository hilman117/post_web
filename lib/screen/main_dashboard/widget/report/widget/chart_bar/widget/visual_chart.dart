import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../models/departement.dart';
import 'widget/stick_bar.dart';

Widget visualChart({
  required List<Departement> data,
  required BuildContext context,
  required List<String> timeLine,
}) {
  final activeDepartement =
      data.where((element) => element.isActive == true).toList();
  return Container(
    alignment: Alignment.bottomCenter,
    height: 500.h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(timeLine.length, (index) {
            return stickBar(data: activeDepartement);
          }),
        ),
        SizedBox(
          height: 3.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(timeLine.length, (index) {
            return Container(
              alignment: Alignment.center,
              width: 15.w,
              // height: 80.h,
              child: Text(
                timeLine[index],
                style:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 12.sp),
              ),
            );
          }),
        )
      ],
    ),
  );
}
