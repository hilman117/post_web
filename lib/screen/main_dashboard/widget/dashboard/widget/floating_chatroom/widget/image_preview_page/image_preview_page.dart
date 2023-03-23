import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ImagePreviewPage extends StatelessWidget {
  const ImagePreviewPage(
      {Key? key, required this.imageUrl, required this.listImageUrl})
      : super(key: key);

  final String imageUrl;
  final List<dynamic> listImageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        alignment: Alignment.center,
        height: double.maxFinite,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            SizedBox(
              height: 700.h,
              width: 700.w,
              child: Hero(
                  tag: imageUrl,
                  child: Image.network(
                    imageUrl,
                  )),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
