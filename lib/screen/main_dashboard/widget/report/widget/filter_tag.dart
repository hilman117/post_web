import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../const.dart';

class FilterTag extends StatelessWidget {
  const FilterTag({
    Key? key,
    required this.labelTag,
    required this.topPosition,
    required this.opacity,
    this.onPressed,
  }) : super(key: key);

  final String labelTag;
  final double topPosition;
  final double opacity;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedPadding(
        duration: const Duration(milliseconds: 500),
        padding: EdgeInsets.only(top: topPosition),
        // right: 50.0,
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 500),
          child: Row(
            children: [
              IconButton(
                  splashRadius: 25.r,
                  iconSize: 25.sp,
                  onPressed: onPressed,
                  icon: Icon(
                    CupertinoIcons.xmark,
                    size: 25.sp.sp,
                    color: mainColor,
                  )),
              Text(
                labelTag,
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: theme.canvasColor),
              )
            ],
          ),
        ));
  }
}
