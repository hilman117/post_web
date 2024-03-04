import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:provider/provider.dart';

popDeleteTitle(BuildContext context, int index) {
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return Consumer<MainDashboardController>(
          builder: (context, value, child) => CupertinoAlertDialog(
                title: const Text("Delete Title"),
                content: Text(
                    "Are you sure want to delete ${value.titles[index].title} from ${value.titles[index].family}"),
                actions: [
                  CupertinoButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoButton(
                    child: Text(
                      "Yes",
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    onPressed: () {},
                  ),
                ],
              ));
    },
  );
}
