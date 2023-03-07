import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/reusable_widget/texfield.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

import '../../../controller_settings.dart';

class AddNewLocation extends StatefulWidget {
  const AddNewLocation({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNewLocation> createState() => _AddNewLocationState();
}

class _AddNewLocationState extends State<AddNewLocation> {
  TextEditingController searchLocation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SettingsController>(context, listen: false);
    final locationName = TextEditingController();
    return Consumer<SettingsController>(
        builder: (context, value, child) => ExpansionTile(
              trailing: const Icon(Icons.add),
              childrenPadding: const EdgeInsets.all(0),
              onExpansionChanged: (value) => controller.expandTheWidget(),
              initiallyExpanded: value.isExpand,
              title: Row(
                children: [
                  Text(
                    "Add Location",
                    style: style18Bold,
                  ),
                  const Spacer(),
                  TexfieldWidget(
                    controller: searchLocation,
                    searchFunction: (value) =>
                        controller.searchingLocation(value),
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
                            "New Location",
                            style: style18Normal,
                          )),
                      SizedBox(
                        height: 45.h,
                        width: 500.w,
                        child: TextFormField(
                          controller: locationName,
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
                          onPressed: () =>
                              controller.addNewLocation(context, locationName),
                          child: value.isLoadingLoadLocation
                              ? Transform.scale(
                                  scale: 0.5,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.0,
                                  ))
                              : Text(
                                  "Register",
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ))),
                )
              ],
            ));
  }
}
