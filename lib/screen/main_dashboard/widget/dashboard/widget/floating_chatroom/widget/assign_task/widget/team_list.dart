import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../models/user.dart';

Widget teamList(BuildContext context) {
  var dataTeam = Provider.of<List<UserDetails>>(context);
  var value = context.watch<ChatroomControlller>();
  final controller = Provider.of<ChatroomControlller>(context, listen: false);
  final theme = Theme.of(context);
  return Expanded(
      child: SizedBox(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "User:",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: theme.canvasColor),
        ),
        SizedBox(
          height: 10.h,
        ),
        Expanded(
          child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(dataTeam.length, (index) {
                  UserDetails item = dataTeam[index];

                  if (item.name
                          .toString()
                          .toLowerCase()
                          .contains(value.searchText.toLowerCase()) ||
                      value.searchText == "") {
                    return InkWell(
                      onTap: () {
                        if (value.assignTo.contains(item.name)) {
                          controller.removeAssignTask(item.name!);
                        } else {
                          controller.inputAssignTask(item.name!);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(3.0.sp),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 0.6,
                              child: Checkbox(
                                side: BorderSide(
                                    width: 0.7, color: theme.canvasColor),
                                value: value.assignTo.contains(item.name)
                                    ? true
                                    : false,
                                onChanged: (val) {
                                  if (value.assignTo.contains(item.name)) {
                                    controller.removeAssignTask(item.name!);
                                  } else {
                                    controller.inputAssignTask(item.name!);
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 200.w,
                              child: Text(
                                item.name!,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: theme.canvasColor,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                }),
              ),
            ),
          ),
        )
      ],
    ),
  ));
}
