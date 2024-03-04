import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../models/departement.dart';

Widget groupList(BuildContext context) {
  var dataGroup = Provider.of<List<Departement>>(context, listen: false);
  final controller = Provider.of<ChatroomControlller>(context, listen: false);
  final theme = Theme.of(context);
  return Consumer<ChatroomControlller>(
    builder: (context, value, child) => Expanded(
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Group:",
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
                    children: List.generate(dataGroup.length, (index) {
                      Departement item = dataGroup[index];
                      if (item.isActive == true &&
                              item.departement
                                  .toString()
                                  .toLowerCase()
                                  .contains(value.searchText.toLowerCase()) ||
                          value.searchText.isEmpty) {
                        return InkWell(
                          onTap: () {
                            if (value.assignTo.contains(item.departement)) {
                              controller.removeAssignTask(item.departement!);
                            } else {
                              controller.inputAssignTask(item.departement!);
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
                                    value: value.assignTo
                                            .contains(item.departement)
                                        ? true
                                        : false,
                                    onChanged: (val) {
                                      if (value.assignTo
                                          .contains(item.departement)) {
                                        controller.removeAssignTask(
                                            item.departement!);
                                      } else {
                                        controller
                                            .inputAssignTask(item.departement!);
                                      }
                                    },
                                  ),
                                ),
                                Text(
                                  item.departement!,
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: theme.canvasColor,
                                      fontWeight: FontWeight.normal),
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
      ),
    ),
  );
}
