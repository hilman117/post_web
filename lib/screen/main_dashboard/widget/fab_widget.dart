import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/create_task/controller_create_task.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/create_task_dialog/create_task_dialog.dart';
import 'package:provider/provider.dart';

class FABWidget extends StatefulWidget {
  const FABWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FABWidget> createState() => _FABWidgetState();
}

class _FABWidgetState extends State<FABWidget> {
  final OverlayPortalController createTaskPortal = OverlayPortalController();
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CreateController>(context, listen: false);
    return Consumer2<DashboardController, MainDashboardController>(
      builder: (context, value, value2, child) => SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        foregroundColor: Colors.white,
        backgroundColor: mainColor,
        children: [
          SpeedDialChild(
            backgroundColor: mainColor2,
            onTap: () async {
              controller.clearAllData();
              // Scaffold.of(context).openEndDrawer();
              createTaskDialog(context);
            },
            label: "Request",
            child: const Icon(
              Icons.create,
              color: Colors.white,
            ),
          ),
          SpeedDialChild(
              backgroundColor: mainColor2,
              label: "Lost and Found",
              child: const Icon(Icons.report_outlined, color: Colors.white)),
        ],
      ),
    );
  }
}
