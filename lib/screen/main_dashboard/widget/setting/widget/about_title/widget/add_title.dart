import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/reusable_widget/texfield.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

import '../../../controller_settings.dart';

class AddNewTitle extends StatelessWidget {
  const AddNewTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SettingsController>(context, listen: false);
    final newTitle = TextEditingController();
    TextEditingController searchTitle = TextEditingController();
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
                  TexfieldWidget(
                    controller: searchTitle,
                    searchFunction: (value) => controller.searchingTitle(value),
                  )
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
                            "New Request Title",
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
                              hintStyle: TextStyle(fontSize: 18.sp),
                              hintText: "input title",
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
                Consumer<DashboardController>(
                    builder: (context, dashboardController, child) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.sp),
                          child: Container(
                              height: 40.h,
                              alignment: Alignment.centerRight,
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: mainColor2),
                                  onPressed: () => controller.addNewTitle(
                                      context,
                                      dashboardController.selecteddepartement,
                                      newTitle),
                                  child: value.isLoadingLoadTitle
                                      ? Transform.scale(
                                          scale: 0.5,
                                          child:
                                              const CircularProgressIndicator(
                                            strokeWidth: 2.0,
                                            color: Colors.white,
                                          ),
                                        )
                                      : Text(
                                          "Register",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.white),
                                        ))),
                        ))
              ],
            ));
  }
}
