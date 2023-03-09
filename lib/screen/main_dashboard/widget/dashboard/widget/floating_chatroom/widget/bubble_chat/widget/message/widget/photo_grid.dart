import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lottie/lottie.dart';

class PhotoGrid extends StatefulWidget {
  final int maxImages;
  final double moreThan4;
  final double isEqualorLessThan1;
  final List<dynamic> imageUrls;
  final Function(int) onImageClicked;
  final Function onExpandClicked;

  const PhotoGrid(
      {required this.imageUrls,
      required this.onImageClicked,
      required this.onExpandClicked,
      this.maxImages = 4,
      Key? key,
      required this.moreThan4,
      required this.isEqualorLessThan1})
      : super(key: key);

  @override
  createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  @override
  Widget build(BuildContext context) {
    var images = buildImages();
    return GridView(
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: (widget.imageUrls.length <= 1)
            ? widget.isEqualorLessThan1
            : widget.moreThan4,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      children: images,
    );
  }

  List<Widget> buildImages() {
    int numImages = widget.imageUrls.length;
    return List<Widget>.generate(min(numImages, widget.maxImages), (index) {
      String imageUrl = widget.imageUrls[index];

      // If its the last image
      if (index == widget.maxImages - 1) {
        // Check how many more images are left
        int remaining = numImages - widget.maxImages;

        // If no more are remaining return a simple image widget
        if (remaining == 0) {
          return GestureDetector(
            child: Image.network(imageUrl, fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return Lottie.asset("images/loadimage.json", width: 100.w);
              } else {
                return child;
              }
            }),
            onTap: () {},
            // () => Get.to(
            //     () => ImageRoom2(
            //           image: imageUrl,
            //           tag:
            //               "tag${widget.imageUrls.length + Random().nextInt(1000)}",
            //           imageList: widget.imageUrls,
            //           indx: index,
            //         ),
            //     transition: Transition.rightToLeft),
          );
        } else {
          // Create the facebook like effect for the last image with number of remaining  images
          return GestureDetector(
            onTap: () {},
            // () => Get.to(
            //     () => ImageRoom2(
            //           image: imageUrl,
            //           tag:
            //               "tag${widget.imageUrls.length + Random().nextInt(1000)}",
            //           imageList: widget.imageUrls,
            //           indx: index,
            //         ),
            //     transition: Transition.rightToLeft),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(imageUrl, fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return Lottie.asset("image/login-loading.json",
                        width: 100.w);
                  } else {
                    return child;
                  }
                }),
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.black54,
                    child: Text(
                      '+' + remaining.toString(),
                      style: TextStyle(fontSize: 32.sp, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      } else {
        return GestureDetector(
            child: SizedBox(
              child: Image.network(
                imageUrl,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return Lottie.asset("image/load_image.png", width: 100.w);
                  } else {
                    return child;
                  }
                },
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {
              // Get.to(
              //     () => ImageRoom2(
              //           image: imageUrl,
              //           tag:
              //               "tag${widget.imageUrls.length + Random().nextInt(1000)}",
              //           imageList: widget.imageUrls,
              //           indx: index,
              //         ),
              //     transition: Transition.rightToLeft);
              // Provider.of<ChatRoomController>(context, listen: false)
              //     .currentIndex(index);
            });
      }
    });
  }
}
