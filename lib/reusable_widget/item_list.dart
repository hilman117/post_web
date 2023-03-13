import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
    required this.valueController,
    required this.index,
    required this.items,
    required this.onEnterHover,
    required this.onExitHover,
    this.selectedIndex,
  }) : super(key: key);
  final dynamic valueController;
  final Function(PointerEnterEvent)? onEnterHover;
  final Function(PointerEnterEvent)? onExitHover;
  final int index;
  final int? selectedIndex;
  final String items;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: onEnterHover,
      onExit: (event) => onExitHover,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
            color: (valueController.hoveringIndex == index)
                ? Colors.blue
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          children: [
            selectedIndex == index
                ? Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 25.sp,
                    ),
                  )
                : SizedBox(
                    width: 30.w,
                  ),
            Text(
              items,
              style: TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.w500,
                  fontSize: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
