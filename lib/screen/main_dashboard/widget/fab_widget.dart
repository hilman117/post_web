import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/create_task_dialog/create_task_dialog.dart';
import 'package:provider/provider.dart';

import '../../../const.dart';

class FABWidget extends StatelessWidget {
  const FABWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainCtrl = context.watch<MainDashboardController>();
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: mainColor2,
      children: [
        SpeedDialChild(
            onTap: () {
              createTaskDialog(context);
              mainCtrl.getProfileData();
            },
            label: "Request",
            child: const Icon(
              Icons.create,
              color: mainColor2,
            )),
        SpeedDialChild(
            label: "Lost and Found",
            child: const Icon(
              Icons.report_outlined,
              color: mainColor2,
            )),
      ],
    );
  }
}
