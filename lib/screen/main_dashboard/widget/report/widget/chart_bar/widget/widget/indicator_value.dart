import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget indicatorValue(BoxConstraints size) {
  return SizedBox(
    // color: Colors.orange,
    width: size.maxWidth * 0.030,
    height: size.maxHeight * 0.8,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              700.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: size.maxWidth * 0.012),
            ),
            Container(
              width: 7.w,
              height: 1.h,
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(
          height: size.maxHeight * 0.086,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              600.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: size.maxWidth * 0.012),
            ),
            Container(
              width: 7.w,
              height: 1.h,
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(
          height: size.maxHeight * 0.086,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              500.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: size.maxWidth * 0.012),
            ),
            Container(
              width: 7.w,
              height: 1.h,
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(
          height: size.maxHeight * 0.086,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              400.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: size.maxWidth * 0.012),
            ),
            Container(
              width: 7.w,
              height: 1.h,
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(
          height: size.maxHeight * 0.086,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              300.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: size.maxWidth * 0.012),
            ),
            Container(
              width: 7.w,
              height: 1.h,
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(
          height: size.maxHeight * 0.086,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              200.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: size.maxWidth * 0.012),
            ),
            Container(
              width: 7.w,
              height: 1.h,
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(
          height: size.maxHeight * 0.086,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              100.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: size.maxWidth * 0.012),
            ),
            Container(
              width: 7.w,
              height: 1.h,
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(
          height: size.maxHeight * 0.086,
        ),
      ],
    ),
    // height: 700.h,
  );
}
