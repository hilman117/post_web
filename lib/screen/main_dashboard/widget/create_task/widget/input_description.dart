import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../const.dart';

class InputDescriptionWidget extends StatelessWidget {
  const InputDescriptionWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            height: 200.h,
            // margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade100,
                    blurRadius: 0.5,
                    spreadRadius: 0.5,
                    offset: const Offset(0.5, 0.5))
              ],
            ),
            child: TextFormField(
              controller: controller,
              minLines: 1,
              maxLines: null,
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              cursorColor: mainColor2,
              cursorHeight: 20.h,
              style: TextStyle(fontSize: 20.sp),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Description...",
                  contentPadding: EdgeInsets.only(top: 0, left: 15.w)),
            ),
          ),
        ),
      ],
    );
  }
}
