import 'package:flutter/material.dart';

import '../../../../../../../../other.dart';
import '../../../right_point.dart';

class RightFeatureAnimated extends StatelessWidget {
  final int pixels;
  final int position;
  final BoxConstraints p1;
  final String title;
  final String subTitle;
  final String imageIcon;
  const RightFeatureAnimated(
      {Key? key,
      required this.pixels,
      required this.position,
      required this.p1,
      required this.title,
      required this.subTitle,
      required this.imageIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 500),
      padding: EdgeInsets.only(top: pixels > position ? 0 : 150),
      child: AnimatedOpacity(
        opacity: pixels > position ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: RightPoint(
          title: title,
          subtitle: subTitle,
          imageIcon: imageIcon,
          textboxSize: p1.maxWidth * 0.60,
          color: secondaryColor,
          imageIconSize: p1.maxWidth * 0.15,
        ),
      ),
    );
  }
}
