import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/create_task/controller_create_task.dart';
import 'package:provider/provider.dart';

import '../../../../../const.dart';
import '../../../../../models/departement.dart';

class DepartementOptionDropDown extends StatelessWidget {
  const DepartementOptionDropDown({
    Key? key,
    required this.dropButtonFocus,
  }) : super(key: key);

  static Departement? dropdownValue;
  final FocusNode dropButtonFocus;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dataDept = Provider.of<List<Departement>>(context);
    final controller = Provider.of<CreateController>(context, listen: false);
    return Consumer<CreateController>(builder: (context, value, child) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
        height: 40.h,
        child: DropdownButton<Departement>(
          isExpanded: true,
          autofocus: true,
          focusColor: mainColor,
          selectedItemBuilder: (context) {
            return dataDept
                .map((e) => Focus(
                      canRequestFocus: true,
                      focusNode: dropButtonFocus,
                      onFocusChange: (value) {
                        controller.getFocusDropDown(dropDown: value);
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.sp),
                          height: 20.h,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              color: theme.scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  color: value.focusDropDown
                                      ? mainColor
                                      : Colors.transparent)),
                          child: Text(
                            e.departement!,
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: theme.canvasColor,
                                fontWeight: FontWeight.normal),
                          )),
                    ))
                .toList();
          },
          dropdownColor: theme.cardColor,
          value: value.deptForRequest ?? dataDept.first,
          elevation: 2,
          style: TextStyle(
              color: theme.canvasColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.normal),
          underline: Container(
            height: 0,
            color: Colors.transparent,
          ),
          items:
              dataDept.map<DropdownMenuItem<Departement>>((Departement value) {
            return DropdownMenuItem<Departement>(
              value: value,
              child: Text(
                value.departement!,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.normal,
                    color: theme.canvasColor),
              ),
            );
          }).toList(),
          onChanged: (Departement? value) {
            // This is called when the user selects an item.
            controller.selectDeptForRequest(value!);
          },
        ),
      );
    });
  }
}
