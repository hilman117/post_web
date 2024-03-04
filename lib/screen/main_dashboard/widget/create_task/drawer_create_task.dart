import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/create_task/controller_create_task.dart';
import 'package:provider/provider.dart';

import 'widget/departement_option.dart';
import 'widget/input_description.dart';
import 'widget/input_form.dart';
import 'widget/uplaod_image_box.dart';

class DrawerCreateTask extends StatefulWidget {
  const DrawerCreateTask({Key? key}) : super(key: key);

  @override
  State<DrawerCreateTask> createState() => _DrawerCreateTaskState();
}

class _DrawerCreateTaskState extends State<DrawerCreateTask> {
  FocusNode titleFocus = FocusNode();
  FocusNode locationFocus = FocusNode();
  FocusNode dropdownFocus = FocusNode();
  TextEditingController description = TextEditingController();

  @override
  void dispose() {
    dropdownFocus.dispose();
    titleFocus.dispose();
    locationFocus.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Provider.of<CreateController>(context, listen: false);
    return Consumer2<CreateController, MainDashboardController>(
        builder: (context, value, value2, child) {
      return GestureDetector(
        onTap: () => controller.getFocusDropDown(
            dropDown: false, title: false, location: false),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          height: double.maxFinite,
          width: 600.w,
          color: theme.cardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100.h,
              ),
              Row(
                children: [
                  Text(
                    "Create New Task",
                    style: TextStyle(fontSize: 22.sp),
                  ),
                  Icon(
                    Icons.create,
                    size: 25.sp,
                    color: mainColor,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    CupertinoIcons.xmark,
                    size: 20.sp,
                    color: theme.focusColor,
                  )
                ],
              ),
              DepartementOptionDropDown(
                dropButtonFocus: dropdownFocus,
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                child: Focus(
                  canRequestFocus: true,
                  focusNode: titleFocus,
                  onFocusChange: (value) =>
                      controller.getFocusDropDown(title: value),
                  child: Autocomplete<String>(
                    optionsViewBuilder: (context, onSelected, options) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          borderRadius: BorderRadius.circular(8.r),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxHeight: 400.h, maxWidth: 300.w),
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(0.0, 0.0),
                                        spreadRadius: 0.5,
                                        blurRadius: 0.5,
                                        color: mainColor)
                                  ],
                                  color: theme.cardColor,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final String option =
                                      options.elementAt(index);
                                  return InkWell(
                                    onTap: () {
                                      onSelected(option);
                                    },
                                    child: Builder(
                                        builder: (BuildContext context) {
                                      final bool highlight =
                                          AutocompleteHighlightedOption.of(
                                                  context) ==
                                              index;
                                      if (highlight) {
                                        SchedulerBinding.instance
                                            .addPostFrameCallback(
                                                (Duration timeStamp) {
                                          Scrollable.ensureVisible(context,
                                              alignment: 0.5);
                                        });
                                      }
                                      return Container(
                                        color: highlight
                                            ? Theme.of(context).focusColor
                                            : null,
                                        padding: EdgeInsets.all(16.0.sp),
                                        child: Text(
                                          option,
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: theme.canvasColor),
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    displayStringForOption: (option) => option,
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      return value.listTitle.where((String option) {
                        return option.toString().toLowerCase().contains(
                            textEditingValue.text.toString().toLowerCase());
                      });
                    },
                    fieldViewBuilder: (context, textEditingController,
                        focusNode, onFieldSubmitted) {
                      return SizedBox(
                        height: 45.h,
                        child: CupertinoTextField(
                          decoration: BoxDecoration(
                              color: theme.scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  color: value.focusTitle
                                      ? mainColor
                                      : Colors.transparent)),
                          cursorHeight: 20.sp,
                          cursorColor: mainColor,
                          cursorWidth: 1.5.sp,
                          placeholder: "Title",
                          placeholderStyle: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.normal,
                              color: theme.canvasColor),
                          controller: textEditingController,
                          focusNode: focusNode,
                        ),
                      );
                    },
                    onSelected: (String selection) {
                      // event.selectUserName(selection.name!);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                child: Focus(
                  canRequestFocus: true,
                  focusNode: locationFocus,
                  onFocusChange: (value) =>
                      controller.getFocusDropDown(location: value),
                  child: Autocomplete<String>(
                    optionsViewBuilder: (context, onSelected, options) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          borderRadius: BorderRadius.circular(8.r),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxHeight: 400.h, maxWidth: 300.w),
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(0.0, 0.0),
                                        spreadRadius: 0.5,
                                        blurRadius: 0.5,
                                        color: mainColor)
                                  ],
                                  color: theme.cardColor,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final String option =
                                      options.elementAt(index);
                                  return InkWell(
                                    onTap: () {
                                      onSelected(option);
                                    },
                                    child: Builder(
                                        builder: (BuildContext context) {
                                      final bool highlight =
                                          AutocompleteHighlightedOption.of(
                                                  context) ==
                                              index;
                                      if (highlight) {
                                        SchedulerBinding.instance
                                            .addPostFrameCallback(
                                                (Duration timeStamp) {
                                          Scrollable.ensureVisible(context,
                                              alignment: 0.5);
                                        });
                                      }
                                      return Container(
                                        color: highlight
                                            ? Theme.of(context).focusColor
                                            : null,
                                        padding: EdgeInsets.all(16.0.sp),
                                        child: Text(
                                          option,
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: theme.canvasColor),
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    displayStringForOption: (option) => option,
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      return value2.data!.location!.where((String option) {
                        return option.toString().toLowerCase().contains(
                            textEditingValue.text.toString().toLowerCase());
                      });
                    },
                    fieldViewBuilder: (context, textEditingController,
                        focusNode, onFieldSubmitted) {
                      return SizedBox(
                        height: 45.h,
                        child: CupertinoTextField(
                          decoration: BoxDecoration(
                              color: theme.scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  color: value.focusLocation
                                      ? mainColor
                                      : Colors.transparent)),
                          cursorHeight: 20.sp,
                          cursorColor: mainColor,
                          cursorWidth: 1.5.sp,
                          placeholder: "Location",
                          placeholderStyle: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.normal,
                              color: theme.canvasColor),
                          controller: textEditingController,
                          focusNode: focusNode,
                        ),
                      );
                    },
                    onSelected: (String selection) {
                      // event.selectUserName(selection.name!);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              InputDescriptionWidget(controller: description),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  InputForm(
                    callback: () => controller.timePIcker(context),
                    icon: Icons.schedule_outlined,
                    label: value.selectedTime != ""
                        ? value.selectedTime
                        : "Set time",
                    isEmpty: value.selectedTime != "" ? false : true,
                    funtion: () => value.clearTime(),
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  InputForm(
                    callback: () => controller.dateTimPicker(context),
                    icon: Icons.date_range_outlined,
                    label: value.newDate != "" ? value.newDate : "Set date",
                    isEmpty: value.newDate != "" ? false : true,
                    funtion: () => controller.clearDate(),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                  onTap: () => controller.selectImage(),
                  child: const UploadImageBox()),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 45.h,
                    width: 200.w,
                    child: CupertinoButton(
                      borderRadius: BorderRadius.circular(8.r),
                      padding: EdgeInsets.all(0.sp),
                      color: CupertinoColors.inactiveGray,
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45.h,
                    width: 200.w,
                    child: CupertinoButton(
                      borderRadius: BorderRadius.circular(8.r),
                      padding: EdgeInsets.all(0.sp),
                      color: mainColor,
                      onPressed: () {},
                      child: Text(
                        "Send",
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
