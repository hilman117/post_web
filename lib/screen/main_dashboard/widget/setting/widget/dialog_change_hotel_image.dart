import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/reusable_widget/button.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:provider/provider.dart';

changeHotelImage(BuildContext context) {
  final theme = Theme.of(context);
  final controller = Provider.of<SettingsController>(context, listen: false);
  return showDialog(
      context: context,
      builder: (context) => Dialog(
            child:
                Consumer<SettingsController>(builder: (context, value, child) {
              return Container(
                height: 450.h,
                width: 700.w,
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: theme.cardColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MouseRegion(
                      onEnter: (event) => controller.changeOtherImage(true),
                      onExit: (event) => controller.changeOtherImage(false),
                      child: Container(
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.memory(
                              value.image!,
                              height: 300.h,
                              fit: BoxFit.cover,
                            ),
                            if (value.isChangeOtherImage)
                              InkWell(
                                onTap: () => controller.changeImage(context),
                                child: Container(
                                  height: 300.h,
                                  alignment: Alignment.center,
                                  color: Colors.black26,
                                  child: Image.asset(
                                    "images/image-editing.png",
                                    width: 100.w,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonCustom(
                          height: 40.h,
                          widht: 100.w,
                          fontSize: 20.sp,
                          buttonLabel: "Cancel",
                          isEnable: false,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        ButtonCustom(
                          height: 40.h,
                          widht: 100.w,
                          fontSize: 20.sp,
                          isWithLoading: true,
                          loadingState: value.isImageUploading,
                          buttonLabel: "Set",
                          onPressed: () => controller.uploadHotelImage(context),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
          ));
}
