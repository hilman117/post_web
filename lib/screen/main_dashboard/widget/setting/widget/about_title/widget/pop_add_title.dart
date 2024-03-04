import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:provider/provider.dart';
import '../../../../../../../models/departement.dart';

popAddTitle(BuildContext context) {
  var data = Provider.of<List<Departement>>(context, listen: false);
  final List<Departement> activeDept =
      data.where((element) => element.isActive == true).toList();
  return showCupertinoDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text("Add title"),
        content: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoButton(
                  minSize: 20.h,
                  padding: const EdgeInsets.all(0),
                  child: Icon(
                    CupertinoIcons.chevron_up,
                    size: 20.h,
                  ),
                  onPressed: () {},
                ),
                CupertinoButton(
                  minSize: 20.h,
                  padding: const EdgeInsets.all(0),
                  child: Icon(CupertinoIcons.chevron_down, size: 20.h),
                  onPressed: () {},
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                // height: 800.h,
                // width: 700.w,
                child: CupertinoPicker(
                  // offAxisFraction: -0.5,
                  itemExtent: 40.h, // Height of each item
                  onSelectedItemChanged: (value) {},
                  children: List.generate(
                    activeDept.length,
                    (index) => Center(
                      child: Text(
                        activeDept[index].departement!,
                        style: TextStyle(fontSize: 20.sp),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Consumer<SettingsController>(builder: (context, value, child) {
              return Expanded(
                  child: SizedBox(
                      child: CupertinoTextField(
                style: TextStyle(fontSize: 18.sp),
              )));
            })
          ],
        ),
        actions: [
          CupertinoActionSheetAction(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "Cancel",
                style: TextStyle(fontSize: 18.sp),
              )),
          CupertinoActionSheetAction(
              onPressed: () {},
              child: Consumer<SettingsController>(
                  builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (value.isLoadingLoadTitle)
                      const CircularProgressIndicator.adaptive(),
                    Text("Save", style: TextStyle(fontSize: 18.sp)),
                  ],
                );
              })),
        ],
      );
    },
  );
}
