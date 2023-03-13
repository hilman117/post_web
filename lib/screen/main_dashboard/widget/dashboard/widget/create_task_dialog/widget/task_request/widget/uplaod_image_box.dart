import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../const.dart';

class UploadImageBox extends StatelessWidget {
  const UploadImageBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10.sp),
        width: double.infinity,
        height: 150.h,
        child: SizedBox(
          width: double.infinity,
          child: DottedBorder(
              borderType: BorderType.RRect,
              dashPattern: const [1, 4],
              color: mainColor2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "image/load_image.png",
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Upload images",
                    style:
                        TextStyle(fontSize: 15.sp, color: Colors.grey.shade300),
                  )
                ],
              )),
        ));
  }
}
