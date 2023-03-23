import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:lottie/lottie.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/widget/image_preview_page/image_preview_page.dart';

class PhotoGrid extends StatefulWidget {
  final int maxImages;
  final List<dynamic> imageUrls;
  final Function(int) onImageClicked;
  final Function onExpandClicked;

  const PhotoGrid({
    required this.imageUrls,
    required this.onImageClicked,
    required this.onExpandClicked,
    this.maxImages = 4,
    Key? key,
  }) : super(key: key);

  @override
  createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  @override
  Widget build(BuildContext context) {
    var images = buildImages();
    return StaggeredGrid.count(
      crossAxisSpacing: 2.h,
      mainAxisSpacing: 2.w,
      crossAxisCount: 4,
      children: List.generate(
          images.length,
          (index) => StaggeredGridTile.count(
              crossAxisCellCount: (widget.imageUrls.length <= 2)
                  ? 4
                  : (widget.imageUrls.length == 3 && index == 1 || index == 2)
                      ? 2
                      : widget.imageUrls.length >= 4
                          ? 2
                          : 4,
              mainAxisCellCount: (widget.imageUrls.length < 2)
                  ? 4
                  : (widget.imageUrls.length == 2)
                      ? 2
                      : (widget.imageUrls.length == 3 && index == 3)
                          ? 4
                          : (widget.imageUrls.length >= 4)
                              ? 2
                              : 2,
              child: images[index])),
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
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  barrierColor: Colors.black.withOpacity(0.5),
                  opaque: false, // set to false
                  pageBuilder: (_, __, ___) => ImagePreviewPage(
                      imageUrl: imageUrl, listImageUrl: widget.imageUrls),
                ),
              );
            },
            child: Hero(
              tag: imageUrl,
              child: Image.network(imageUrl, fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return Lottie.asset("images/loadimage.json", width: 100.w);
                } else {
                  return child;
                }
              }),
            ),
          );
        } else {
          // Create the facebook like effect for the last image with number of remaining  images
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  barrierColor: Colors.black.withOpacity(0.5),
                  opaque: false, // set to false
                  pageBuilder: (_, __, ___) => ImagePreviewPage(
                      imageUrl: imageUrl, listImageUrl: widget.imageUrls),
                ),
              );
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                Hero(
                  tag: imageUrl,
                  child: Image.network(imageUrl, fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return Lottie.asset("image/login-loading.json",
                          width: 100.w);
                    } else {
                      return child;
                    }
                  }),
                ),
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
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                barrierColor: Colors.black.withOpacity(0.5),
                opaque: false, // set to false
                pageBuilder: (_, __, ___) => ImagePreviewPage(
                    imageUrl: imageUrl, listImageUrl: widget.imageUrls),
              ),
            );
          },
          child: SizedBox(
            child: Hero(
              tag: imageUrl,
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
          ),
        );
      }
    });
  }
}
