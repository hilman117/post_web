import 'package:flutter/material.dart';

import '../../../../../../../other.dart';
import '../../../../left_point.dart';

class LeftFeatureAnimated extends StatelessWidget {
  final int pixels;
  final int position;
  final BoxConstraints p1;
  final String title;
  final String subTitle;
  final String imageIcon;
  const LeftFeatureAnimated(
      {Key? key,
      required this.pixels,
      required this.p1,
      required this.title,
      required this.subTitle,
      required this.imageIcon,
      required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 500),
      padding: EdgeInsets.only(top: pixels > position ? 0 : 150),
      child: AnimatedOpacity(
        opacity: pixels > position ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: LeftPoint(
          title: title,
          subtitle: subTitle,
          imageIcon: imageIcon,
          color: mainColor,
          textBoxSize: p1.maxWidth * 0.60,
          imageIconSize: p1.maxWidth * 0.15,
          left: MainAxisAlignment.end,
        ),
      ),
    );
  }
}
