import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/other.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/employee_account/widget/search_field_setting.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

import '../../../../../controller_settings.dart';

class AddNewTitle extends StatelessWidget {
  const AddNewTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SettingsController>(context, listen: false);
    final newTitle = TextEditingController();
    return Consumer<SettingsController>(
        builder: (context, value, child) => ExpansionTile(
              trailing: const Icon(Icons.add),
              childrenPadding: const EdgeInsets.all(0),
              onExpansionChanged: (value) => controller.expandTheWidget(),
              initiallyExpanded: value.isExpand,
              title: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add title",
                        style: style18Bold,
                      ),
                      Text(
                        "Select the departement to show the title list",
                        style: style15Normal,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const SearchFieldSettings()
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
                            "New Title",
                            style: style18Normal,
                          )),
                      SizedBox(
                        height: 45.h,
                        width: 500.w,
                        child: TextFormField(
                          controller: newTitle,
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
                  padding: EdgeInsets.symmetric(horizontal: 30.sp),
                  child: Container(
                      height: 40.h,
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor2),
                          onPressed: () {},
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
