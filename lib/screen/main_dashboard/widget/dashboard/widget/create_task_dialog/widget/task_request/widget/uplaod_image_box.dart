import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/create_task_dialog/controller/controller_create_task.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../const.dart';

class UploadImageBox extends StatelessWidget {
  const UploadImageBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final valueCreate = context.watch<CreateController>();
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10.sp),
        width: double.infinity,
        height: 150.h,
        child: SizedBox(
          width: double.infinity,
          child: valueCreate.imageList.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: valueCreate.imageList.length,
                  itemBuilder: (context, index) {
                    var image = valueCreate.imageList[index];
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.memory(
                            image,
                            height: 130.h,
                            width: 130.w,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () => valueCreate.removeSingleImage(index),
                            child: Icon(
                              Icons.cancel,
                              color: Colors.grey,
                              size: 20.sp,
                            ),
                          ),
                        )
                      ],
                    );
                  })
              : DottedBorder(
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
                        style: TextStyle(
                            fontSize: 15.sp, color: Colors.grey.shade300),
                      )
                    ],
                  )),
        ));
  }
}
