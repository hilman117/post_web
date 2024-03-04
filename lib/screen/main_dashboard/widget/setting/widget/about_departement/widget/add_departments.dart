import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:provider/provider.dart';

import '../../../controller_settings.dart';

class AddNewDepartement extends StatelessWidget {
  const AddNewDepartement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SettingsController>(context, listen: false);
    final departementName = TextEditingController();
    final theme = Theme.of(context);
    return Consumer2<SettingsController, MainDashboardController>(
        builder: (context, value, value2, child) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Departement",
                            style: TextStyle(
                                fontSize: 35.sp,
                                fontWeight: FontWeight.bold,
                                color: theme.canvasColor),
                          ),
                          Text(
                            "Turn on the switch button to make the group be able to receive request",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                                color: theme.canvasColor),
                          ),
                          Text(
                            "Groups with active buttons can only send requests",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                                color: theme.canvasColor),
                          ),
                        ],
                      ),
                    ),
                    CupertinoButton(
                      child: Row(
                        children: [
                          Text(
                            "Add departement",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.blue),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            value.isExpand
                                ? CupertinoIcons.chevron_up
                                : CupertinoIcons.chevron_down,
                            color: Colors.blue,
                            size: 20.sp,
                          )
                        ],
                      ),
                      onPressed: () => controller.expandTheWidget(),
                    )
                  ],
                ),
                if (value.isExpand)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 200.w,
                            child: Text(
                              "Departement name",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: theme.canvasColor,
                                  fontWeight: FontWeight.normal),
                            )),
                        Expanded(
                          child: SizedBox(
                              height: 45.h,
                              child: CupertinoTextField(
                                style: TextStyle(fontSize: 18.sp),
                                placeholderStyle: TextStyle(
                                    fontSize: 18.sp, color: Colors.grey),
                                controller: departementName,
                                placeholder: "Departement",
                              )),
                        )
                      ],
                    ),
                  ),
                if (value.isExpand)
                  SizedBox(
                    height: 20.h,
                  ),
                if (value.isExpand)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            width: 200.w,
                            height: 50,
                            child: Text(
                              "Select Icon",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: theme.canvasColor,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.left,
                            )),
                        SizedBox(
                            width: 500.w,
                            // height: 100.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    color: theme.scaffoldBackgroundColor,
                                    // height: 200.h,
                                    child: Wrap(
                                      children: List.generate(
                                          departementIcon.length,
                                          (index) => InkWell(
                                                onTap: () =>
                                                    controller.selectIcon(
                                                        departementIcon[index]),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.asset(
                                                    departementIcon[index],
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
                if (value.isExpand)
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
                            child: value.isNewDepartementLoading
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
            )
        // ExpansionTile(
        //       trailing: const Icon(Icons.add),
        //       childrenPadding: const EdgeInsets.all(0),
        //       onExpansionChanged: (value) => controller.expandTheWidget(),
        //       initiallyExpanded: value.isExpand,
        //       title: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             "Add departement",
        //             style: TextStyle(
        //                 fontSize: 18.sp,
        //                 fontWeight: FontWeight.bold,
        //                 color: theme.canvasColor),
        //           ),
        //           Text(
        //             "Turn on the switch button to make the group be able to receive request",
        //             style: TextStyle(
        //                 fontSize: 15.sp,
        //                 fontWeight: FontWeight.normal,
        //                 color: theme.canvasColor),
        //           ),
        //           Text(
        //             "Groups with active buttons can only send requests",
        //             style: TextStyle(
        //                 fontSize: 15.sp,
        //                 fontWeight: FontWeight.normal,
        //                 color: theme.canvasColor),
        //           ),
        //         ],
        //       ),
        //       children: [
        //         Padding(
        //           padding: EdgeInsets.symmetric(horizontal: 30.w),
        //           child: Row(
        //             children: [
        //               SizedBox(
        //                   width: 200.w,
        //                   child: Text(
        //                     "Group name",
        //                     style: TextStyle(
        //                         fontSize: 18.sp,
        //                         color: theme.canvasColor,
        //                         fontWeight: FontWeight.normal),
        //                   )),
        //               SizedBox(
        //                 height: 45.h,
        //                 width: 500.w,
        //                 child: TextFormField(
        //                   controller: departementName,
        //                   cursorHeight: 18.h,
        //                   style: TextStyle(
        //                       fontSize: 18.sp,
        //                       color: theme.canvasColor,
        //                       fontWeight: FontWeight.normal),
        //                   textAlignVertical: TextAlignVertical.center,
        //                   decoration: InputDecoration(
        //                       contentPadding: EdgeInsets.all(10.sp),
        //                       // isDense: true,
        //                       border: OutlineInputBorder(
        //                           borderSide:
        //                               BorderSide(color: Colors.blue.shade100),
        //                           borderRadius: BorderRadius.circular(6)),
        //                       enabledBorder: OutlineInputBorder(
        //                           borderSide:
        //                               BorderSide(color: Colors.blue.shade100),
        //                           borderRadius: BorderRadius.circular(6)),
        //                       focusedBorder: OutlineInputBorder(
        //                           borderSide:
        //                               BorderSide(color: Colors.blue.shade100),
        //                           borderRadius: BorderRadius.circular(6))),
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //         Padding(
        //           padding: EdgeInsets.symmetric(horizontal: 30.w),
        //           child: Row(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Container(
        //                   alignment: Alignment.centerLeft,
        //                   width: 200.w,
        //                   height: 50,
        //                   child: Text(
        //                     "Select Icon",
        //                     style: TextStyle(
        //                         fontSize: 18.sp,
        //                         color: theme.canvasColor,
        //                         fontWeight: FontWeight.normal),
        //                   )),
        //               SizedBox(
        //                   width: 500.w,
        //                   // height: 100.h,
        //                   child: Column(
        //                     mainAxisAlignment: MainAxisAlignment.start,
        //                     children: [
        //                       Container(
        //                           color: Colors.white,
        //                           // height: 200.h,
        //                           child: Wrap(
        //                             children: List.generate(
        //                                 departementIcon.length,
        //                                 (index) => InkWell(
        //                                       onTap: () =>
        //                                           controller.selectIcon(
        //                                               departementIcon[index]),
        //                                       child: Padding(
        //                                         padding:
        //                                             const EdgeInsets.all(8.0),
        //                                         child: Image.asset(
        //                                           departementIcon[index],
        //                                           width: 35.w,
        //                                           height: 35.h,
        //                                         ),
        //                                       ),
        //                                     )),
        //                           )),
        //                       Container(
        //                         alignment: Alignment.centerLeft,
        //                         color: Colors.white,
        //                         // height: 50.h,
        //                         child: Wrap(
        //                           children: [
        //                             value.iconSelected == ""
        //                                 ? const SizedBox()
        //                                 : Image.asset(
        //                                     value.iconSelected,
        //                                     width: 40.w,
        //                                     height: 40.h,
        //                                   ),
        //                           ],
        //                         ),
        //                       ),
        //                     ],
        //                   )),
        //             ],
        //           ),
        //         ),
        //         Padding(
        //           padding: EdgeInsets.symmetric(horizontal: 30.sp),
        //           child: Container(
        //               height: 40.h,
        //               alignment: Alignment.centerRight,
        //               width: double.infinity,
        //               child: ElevatedButton(
        //                   style: ElevatedButton.styleFrom(
        //                       backgroundColor: mainColor2),
        //                   onPressed: () => controller.registeNewDepartement(
        //                       context, departementName),
        //                   child: value.isNewDepartementLoading
        //                       ? Transform.scale(
        //                           scale: 0.5,
        //                           child: const CircularProgressIndicator(
        //                             color: Colors.white,
        //                             strokeWidth: 2.0,
        //                           ))
        //                       : Text(
        //                           "Register",
        //                           style: TextStyle(
        //                               fontSize: 16.sp, color: Colors.white),
        //                         ))),
        //         )
        //       ],
        //     )
        );
  }
}
