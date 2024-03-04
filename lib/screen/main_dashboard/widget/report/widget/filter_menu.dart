import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../const.dart';

Widget filterMenu(
    {required BuildContext context,
    required FocusNode focusNode,
    required String label,
    required TextEditingController controllertext}) {
  final theme = Theme.of(context);
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(8.r), boxShadow: [
      BoxShadow(
          offset: const Offset(0.0, 0.0),
          spreadRadius: 1,
          blurRadius: 1,
          color: focusNode.hasFocus ? mainColor : Colors.transparent)
    ]),
    margin: EdgeInsets.symmetric(horizontal: 5.sp),
    width: 200.w,
    height: 40.h,
    child: CupertinoTextField(
      controller: controllertext,
      focusNode: focusNode,
      cursorColor: mainColor,
      cursorWidth: 1.5,
      cursorHeight: 18.h,
      placeholderStyle: TextStyle(
          fontSize: 18.sp, color: Colors.grey, fontWeight: FontWeight.normal),
      style: TextStyle(fontSize: 18.sp, color: theme.canvasColor),
      placeholder: label,
    ),
  );
}
