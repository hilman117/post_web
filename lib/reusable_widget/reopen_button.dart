import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:provider/provider.dart';

import '../const.dart';
import '../style.dart';

class ReopenButton extends StatelessWidget {
  const ReopenButton({
    Key? key,
    required this.idTask,
  }) : super(key: key);

  final String idTask;

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<ChatroomControlller>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 30.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    foregroundColor: mainColor2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))),
                onPressed: () => ctrl.reopenTask(context, idTask),
                child: Text(
                  "Reopen",
                  style: style15Normal,
                )),
          ),
        ),
      ],
    );
  }
}
