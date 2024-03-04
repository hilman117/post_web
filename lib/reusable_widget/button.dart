import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom(
      {Key? key,
      required this.buttonLabel,
      this.isEnable = true,
      this.onPressed,
      this.isWithLoading = false,
      this.loadingState = false,
      this.radius = 8,
      this.height = 40,
      this.widht = 100,
      this.fontSize = 20})
      : super(key: key);
  final String buttonLabel;
  final bool? isEnable;
  final bool? isWithLoading;
  final bool? loadingState;
  final double? radius;
  final double? height;
  final double? widht;
  final double? fontSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
        height: height,
        width: widht,
        child: isWithLoading!
            ? CupertinoButton(
                onPressed: onPressed,
                color: isEnable! ? mainColor : Colors.grey,
                borderRadius: BorderRadius.circular(radius!),
                padding: EdgeInsets.all(4.sp),
                child: loadingState!
                    ? SizedBox(
                        height: 13.h,
                        width: 13.sp,
                        child: const CircularProgressIndicator(
                          strokeWidth: 1,
                          color: Colors.white,
                        ))
                    : Text(
                        buttonLabel,
                        style: TextStyle(
                            fontSize: fontSize,
                            color:
                                isEnable! ? Colors.white : theme.canvasColor),
                      ))
            : CupertinoButton(
                onPressed: onPressed,
                color: isEnable! ? mainColor : Colors.grey,
                borderRadius: BorderRadius.circular(radius!),
                padding: EdgeInsets.all(4.sp),
                child: Text(
                  buttonLabel,
                  style: TextStyle(
                      fontSize: fontSize,
                      color: isEnable! ? Colors.white : theme.canvasColor),
                )));
  }
}
