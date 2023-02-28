import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/other.dart';
import 'package:post_web/style.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.w),
      height: 35.h,
      width: 200.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: mainColor.withOpacity(0.05)),
      child: TextFormField(
        style: style20Normal,
        cursorHeight: 20.h,
        cursorColor: mainColor,
        decoration: InputDecoration(
            hintStyle: const TextStyle(fontStyle: FontStyle.italic),
            hintText: "Search",
            isDense: true,
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search_outlined,
              color: Colors.black54,
              size: 20.sp,
            ),
            prefixIconConstraints: BoxConstraints(maxWidth: 20.w)),
      ),
    );
  }
}
