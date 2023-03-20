import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TexfieldWidget extends StatelessWidget {
  const TexfieldWidget({
    Key? key,
    this.controller,
    this.searchFunction,
    this.bgCOlor,
    this.width,
    this.height,
    this.hintText,
    this.fontHeight,
    this.focusNode,
    this.maxLines,
  }) : super(key: key);

  final TextEditingController? controller;
  final Function(String)? searchFunction;
  final Color? bgCOlor;
  final double? width;
  final double? height;
  final double? fontHeight;
  final String? hintText;
  final FocusNode? focusNode;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: width ?? 150.w,
        height: height ?? 50.h,
        padding: const EdgeInsets.symmetric(
          vertical: 4,
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: bgCOlor ?? Colors.grey.shade200),
          // padding: const EdgeInsets.only(left: 3),
          child: TextFormField(
            focusNode: focusNode,
            onChanged: searchFunction,
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            style:
                TextStyle(fontSize: fontHeight ?? 15.sp, color: Colors.black87),
            cursorHeight: fontHeight ?? 11.sp,
            cursorWidth: 1,
            maxLines: maxLines ?? 1,
            minLines: 1,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 9),
              filled: true,
              hintText: hintText ?? "Search...",
              hintStyle: TextStyle(
                  fontSize: fontHeight ?? 15.sp, color: Colors.black87),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(color: Colors.transparent, width: 1.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(color: Colors.transparent, width: 1.0),
              ),
            ),
          ),
        ));
  }
}
