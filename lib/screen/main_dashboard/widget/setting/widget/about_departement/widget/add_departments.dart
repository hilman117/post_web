import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/other.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

import '../../../controller_settings.dart';

class AddNewDepartement extends StatefulWidget {
  const AddNewDepartement({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNewDepartement> createState() => _AddNewDepartementState();
}

class _AddNewDepartementState extends State<AddNewDepartement> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SettingsController>(context, listen: false);
    final departementName = TextEditingController();
    return Consumer<SettingsController>(
        builder: (context, value, child) => ExpansionTile(
              trailing: const Icon(Icons.add),
              childrenPadding: const EdgeInsets.all(0),
              onExpansionChanged: (value) => controller.expandTheWidget(),
              initiallyExpanded: value.isExpand,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add departement",
                    style: style18Bold,
                  ),
                  Text(
                    "Turn on the switch button to make the group be able to receive request",
                    style: style15Normal,
                  ),
                ],
              ),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 200.w,
                          child: Text(
                            "Group name",
                            style: style18Normal,
                          )),
                      SizedBox(
                        height: 45.h,
                        width: 500.w,
                        child: TextFormField(
                          controller: departementName,
                          cursorHeight: 18.h,
                          style: style18Normal,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.sp),
                              // isDense: true,
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue.shade100),
                                  borderRadius: BorderRadius.circular(6)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue.shade100),
                                  borderRadius: BorderRadius.circular(6)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue.shade100),
                                  borderRadius: BorderRadius.circular(6))),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          width: 200.w,
                          height: 50,
                          child: Text(
                            "Select Icon",
                            style: style18Normal,
                          )),
                      SizedBox(
                          width: 500.w,
                          // height: 100.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  // height: 200.h,
                                  child: Wrap(
                                children: List.generate(
                                    value.departementIcon.length,
                                    (index) => InkWell(
                                          onTap: () => controller.selectIcon(
                                              value.departementIcon[index]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              value.departementIcon[index],
                                              width: 35.w,
                                              height: 35.h,
                                            ),
                                          ),
                                        )),
                              )),
                              Container(
                                alignment: Alignment.centerLeft,
                                // height: 50.h,
                                child: Wrap(
                                  children: [
                                    value.iconSelected == ""
                                        ? const SizedBox()
                                        : Image.asset(
                                            value.iconSelected,
                                            width: 40.w,
                                            height: 40.h,
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.sp),
                  child: Container(
                      height: 40.h,
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor2),
                          onPressed: () => controller.registeNewDepartement(
                              context, departementName),
                          child: Text(
                            "Register",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.white),
                          ))),
                )
              ],
            ));
  }
}
