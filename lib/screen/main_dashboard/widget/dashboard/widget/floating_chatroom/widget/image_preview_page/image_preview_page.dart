import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../const.dart';

class ImagePreviewPage extends StatefulWidget {
  const ImagePreviewPage(
      {Key? key,
      required this.imageUrl,
      required this.listImageUrl,
      required this.index})
      : super(key: key);

  final String imageUrl;
  final int index;
  final List<dynamic> listImageUrl;

  @override
  State<ImagePreviewPage> createState() => _ImagePreviewPageState();
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {
  int current = 0;

  final CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final event = Provider.of<ChatroomControlller>(context, listen: false);
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
            Material(
              borderRadius: BorderRadius.circular(50),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  setState(() {
                    controller.previousPage();
                  });
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.transparent,
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: 1000.w,
                    child: IconButton(
                        splashRadius: 25.sp,
                        onPressed: () => event.downloadImage(),
                        icon: Icon(
                          Icons.download,
                          color: Colors.white,
                          size: 40.sp,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 700.h,
                  width: 1500.w,
                  child: CarouselSlider(
                      carouselController: controller,
                      items: List.generate(widget.listImageUrl.length, (index) {
                        return GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Hero(
                            tag: widget.imageUrl,
                            child: Image.network(
                              widget.listImageUrl[index],
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                event.getCurrentImageUrl(
                                    widget.listImageUrl[index]);
                                if (loadingProgress != null) {
                                  return Image.asset("image/load_image.png");
                                } else {
                                  return child;
                                }
                              },
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      }),
                      options: CarouselOptions(
                          viewportFraction: 1,
                          // aspectRatio: 1000 / 1000,
                          initialPage: widget.index,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: false,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              current = index;
                            });
                            // provider.currentIndex(index);

                            // print(provider.current);
                          })),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  // color: Colors.blue,
                  height: 50.h,
                  width: 500.w,
                  padding: EdgeInsets.only(left: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.listImageUrl.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => controller.animateToPage(entry.key),
                        child: Container(
                          width: 20.w,
                          height: 20.h,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: current == entry.key
                                  ? mainColor2
                                  : Colors.grey.shade300),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Material(
              borderRadius: BorderRadius.circular(50),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  setState(() {
                    controller.nextPage();
                  });
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
