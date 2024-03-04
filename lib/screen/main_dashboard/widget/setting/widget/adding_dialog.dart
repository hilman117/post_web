import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/reusable_widget/button.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:provider/provider.dart';

addingDialog(
    BuildContext context,
    String label,
    TextEditingController textController,
    void Function()? onPressed,
    bool isLoading) {
  final theme = Theme.of(context);
  // final controller = Provider.of<SettingsController>(context, listen: false);
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: FittedBox(
          child: Container(
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
                    TextFormField(
                      controller: textController,
                      decoration: InputDecoration(
                          hintText: label,
                          hintStyle: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 5.sp,
                            vertical: 0,
                          ),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                      autofocus: true,
                      cursorHeight: 15.h,
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 10.sp),
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
                            buttonLabel: "Add")
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
