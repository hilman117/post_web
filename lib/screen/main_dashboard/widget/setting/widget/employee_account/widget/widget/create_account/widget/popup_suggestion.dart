import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopUpSuggestion extends StatelessWidget {
  const PopUpSuggestion({
    Key? key,
    required this.leftPosition,
    required this.topPosition,
    required this.child,
    this.height,
  }) : super(key: key);

  final double leftPosition;
  final double topPosition;
  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftPosition,
      top: topPosition,
      child: Container(
        alignment: Alignment.topCenter,
        height: height ?? 200.h,
        child: Container(
            width: 402.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: child),
      ),
    );
  }
}
