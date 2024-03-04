import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:provider/provider.dart';

import '../../../../../reusable_widget/button.dart';

confirmDialog(
    {required BuildContext context,
    required String confirmText,
    required int index,
    required bool isLoading,
    required void Function()? onPressed}) {
  final theme = Theme.of(context);
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: FittedBox(
          child: Container(
            alignment: Alignment.center,
            width: 300.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: theme.cardColor),
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Consumer<SettingsController>(
                  builder: (context, value, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      confirmText,
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonCustom(
                            onPressed: () => Navigator.of(context).pop(),
                            isEnable: false,
                            height: 30.h,
                            widht: 100.w,
                            fontSize: 18.sp,
                            buttonLabel: "Cancel"),
                        ButtonCustom(
                            height: 30.h,
                            widht: 100.w,
                            fontSize: 18.sp,
                            isWithLoading: true,
                            loadingState: isLoading,
                            onPressed: onPressed,
                            buttonLabel: "Yes")
                      ],
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      );
    },
  );
}
