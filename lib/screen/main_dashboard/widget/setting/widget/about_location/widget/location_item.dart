import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:provider/provider.dart';

import '../../../../../../../style.dart';

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
    return Column(
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 170.w,
              child: Text(
                location,
                style: style18Normal,
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
                    Icons.delete_outlined,
                    size: 25.sp,
                    color: Colors.grey,
                  )),
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
