import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../const.dart';
import '../../../../../../../../../style.dart';

class PopUpMenuItemWidget extends StatelessWidget {
  const PopUpMenuItemWidget({
    Key? key,
    this.icon,
    this.iconSize,
    required this.itemMenuName,
    this.widhtItem,
    this.bgColor,
    this.styTextLabel,
    this.heightItem,
    this.iconColor,
  }) : super(key: key);

  final IconData? icon;
  final double? iconSize;
  final double? widhtItem;
  final double? heightItem;
  final String itemMenuName;
  final Color? bgColor;
  final Color? iconColor;
  final TextStyle? styTextLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightItem ?? 50.h,
      width: widhtItem ?? 150.w,
      color: bgColor ?? Colors.transparent,
      child: Row(
        children: [
          Icon(
            icon,
            size: iconSize ?? 25.sp,
            color: iconColor ?? mainColor2,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            itemMenuName,
            style: styTextLabel ?? style15Normal,
          ),
        ],
      ),
    );
  }
}
