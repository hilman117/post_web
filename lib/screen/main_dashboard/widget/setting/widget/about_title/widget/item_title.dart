import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:provider/provider.dart';

import '../../../../../../../style.dart';

class ItemTitle extends StatelessWidget {
  const ItemTitle({
    Key? key,
    required this.title,
    required this.currentList,
    required this.index,
  }) : super(key: key);

  final String title;
  final List currentList;
  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SettingsController>(context, listen: false);
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
                style: style18Normal,
              ),
            ),
            const Spacer(),
            Consumer<DashboardController>(
              builder: (context, value, child) => Material(
                color: Colors.transparent,
                child: IconButton(
                    splashColor: Colors.grey,
                    splashRadius: 15,
                    onPressed: () => controller.removeTitle(
                        context: context,
                        toDepartement: value.selecteddepartement,
                        currentList: currentList,
                        indexToRemove: index),
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
}
