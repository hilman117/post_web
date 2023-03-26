import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/create_task_dialog/create_task_dialog.dart';
import 'package:provider/provider.dart';

class FABWidget extends StatelessWidget {
  const FABWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainCtrl = context.watch<MainDashboardController>();
    final dahsboardCtrl = context.watch<DashboardController>();
    // final theme = Theme.of(context);
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: mainColor2,
      children: [
        SpeedDialChild(
            onTap: () async {
              dahsboardCtrl.clearSelectedDept();
              createTaskDialog(context);
              mainCtrl.getProfileData();
            },
            label: "Request",
            child: const Icon(
              Icons.create,
            )),
        SpeedDialChild(
            label: "Lost and Found",
            child: const Icon(
              Icons.report_outlined,
            )),
      ],
    );
  }
}
