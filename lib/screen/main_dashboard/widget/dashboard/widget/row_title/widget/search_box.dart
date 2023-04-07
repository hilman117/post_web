import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/style.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(left: 5.w),
      height: 35.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: theme.iconTheme.color!.withOpacity(0.05)),
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
              color: theme.iconTheme.color,
              size: 20.sp,
            ),
            prefixIconConstraints: BoxConstraints(maxWidth: 20.w)),
      ),
    );
  }
}
