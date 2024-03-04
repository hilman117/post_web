import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:provider/provider.dart';

Widget itemTitle(
    {required BuildContext context,
    required String title,
    required List currentList,
    required int index}) {
  final theme = Theme.of(context);
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 800.w,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18.sp,
                  color: theme.canvasColor,
                  fontWeight: FontWeight.normal),
            ),
          ),
          const Spacer(),
          Consumer<DashboardController>(
            builder: (context, value, child) => Material(
              color: Colors.transparent,
              child: IconButton(
                  splashColor: Colors.grey,
                  splashRadius: 15,
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_outlined,
                    size: 25.sp,
                    color: Colors.grey,
                  )),
            ),
          )
        ],
      ),
      const Divider()
    ],
  );
}
