import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:provider/provider.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({
    Key? key,
    required this.location,
    required this.currentLocationList,
    required this.indexToRemove,
  }) : super(key: key);

  final String location;
  final List currentLocationList;
  final int indexToRemove;

  @override
  Widget build(BuildContext context) {
    final settingCtrl = Provider.of<SettingsController>(context, listen: false);
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 170.w,
              child: Text(
                location,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: theme.canvasColor,
                    fontWeight: FontWeight.normal),
              ),
            ),
            const Spacer(),
            Material(
              color: Colors.transparent,
              child: IconButton(
                  splashColor: Colors.grey,
                  splashRadius: 15.sp,
                  onPressed: () => settingCtrl.removeLocation(
                      context: context,
                      currentList: currentLocationList,
                      indexToRemove: indexToRemove),
                  icon: Icon(
                    CupertinoIcons.delete,
                    size: 25.sp,
                  )),
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
