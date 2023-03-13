import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/create_task_dialog/controller/controller_create_task.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/create_task_dialog/create_task_dialog.dart';
import 'package:provider/provider.dart';

import '../../../const.dart';

class FABWidget extends StatelessWidget {
  const FABWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainCrtl = context.watch<CreateController>();
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: mainColor2,
      children: [
        SpeedDialChild(
            onTap: () {
              if (mainCrtl.isPopUpTitle) {
                mainCrtl.hideePopUp();
              }
              createTaskDialog(context);
            },
            label: "Request",
            child: const Icon(
              Icons.create,
              color: mainColor2,
            )),
        SpeedDialChild(
            label: "Los and Found",
            child: const Icon(
              Icons.report_outlined,
              color: mainColor2,
            )),
      ],
    );
  }
}
