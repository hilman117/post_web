import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/reusable_widget/button.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/create_task/widget/departement_option.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/create_task/controller_create_task.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../const.dart';
import 'widget/input_description.dart';
import 'widget/input_form.dart';
import 'widget/uplaod_image_box.dart';

Widget task(BuildContext context) {
  final dashboardCtrl = context.watch<DashboardController>();
  final createCtrl = context.watch<CreateController>();
  final mainCtrl = context.watch<MainDashboardController>();
  final description = TextEditingController();
  final createFunction = Provider.of<CreateController>(context, listen: false);

  final theme = Theme.of(context);
  FocusNode dropdownFocus = FocusNode();
  FocusNode titleFocus = FocusNode();
  FocusNode locationFocus = FocusNode();
  return GestureDetector(
    child: Consumer<CreateController>(builder: (context, value, child) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: theme.cardColor,
        ),
        margin: EdgeInsets.only(top: 5.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DepartementOptionDropDown(dropButtonFocus: dropdownFocus),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
              child: Focus(
                canRequestFocus: true,
                focusNode: titleFocus,
                onFocusChange: (value) =>
                    createCtrl.getFocusDropDown(title: value),
                child: Autocomplete<String>(
                  optionsViewBuilder: (context, onSelected, options) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        borderRadius: BorderRadius.circular(8.r),
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 400.h, maxWidth: 300.w),
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
                                final String option = options.elementAt(index);
                                return InkWell(
                                  onTap: () {
                                    onSelected(option);
                                  },
                                  child:
                                      Builder(builder: (BuildContext context) {
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
                  fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) {
                    return SizedBox(
                      height: 40.h,
                      child: CupertinoTextField(
                        padding: EdgeInsets.only(left: 10.sp),
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
                    createCtrl.selectingLocationAndTitle(title: selection);
                  },
                ),
              ),
            ),
            Consumer<MainDashboardController>(builder: (context, val, child) {
              return Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                child: Focus(
                  canRequestFocus: true,
                  focusNode: locationFocus,
                  onFocusChange: (value) =>
                      createCtrl.getFocusDropDown(location: value),
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
                      return val.data!.location!.where((String option) {
                        return option.toString().toLowerCase().contains(
                            textEditingValue.text.toString().toLowerCase());
                      });
                    },
                    fieldViewBuilder: (context, textEditingController,
                        focusNode, onFieldSubmitted) {
                      return SizedBox(
                        height: 40.h,
                        child: CupertinoTextField(
                          padding: EdgeInsets.only(left: 10.sp),
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
                      createCtrl.selectingLocationAndTitle(location: selection);
                    },
                  ),
                ),
              );
            }),
            InputDescriptionWidget(
              controller: description,
            ),
            Row(
              children: [
                InputForm(
                  callback: () => createFunction.timePIcker(context),
                  icon: Icons.schedule_outlined,
                  label: createCtrl.selectedTime != ""
                      ? createCtrl.selectedTime
                      : "Set time",
                  isEmpty: createCtrl.selectedTime != "" ? false : true,
                  funtion: () => createCtrl.clearTime(),
                ),
                InputForm(
                  callback: () => createFunction.dateTimPicker(context),
                  icon: Icons.date_range_outlined,
                  label: createCtrl.newDate != ""
                      ? createCtrl.newDate
                      : "Set date",
                  isEmpty: createCtrl.newDate != "" ? false : true,
                  funtion: () => createCtrl.clearDate(),
                ),
              ],
            ),
            InkWell(
                onTap: () => createFunction.selectImage(),
                child: const UploadImageBox()),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonCustom(
                  isEnable: false,
                  height: 40.h,
                  widht: 100.w,
                  fontSize: 20.sp,
                  buttonLabel: "Cancel",
                  onPressed: () => Navigator.of(context).pop(),
                ),
                ButtonCustom(
                    height: 40.h,
                    widht: 100.w,
                    fontSize: 20.sp,
                    buttonLabel: "Send",
                    onPressed: () async {
                      await createCtrl.createTask(
                        context: context,
                        selectedDept: dashboardCtrl.deptSelected,
                        description: description,
                        listAdminEmail: mainCtrl.data!.admin!,
                      );
                      dashboardCtrl.clearSelectedDept();
                    })
              ],
            ),
          ],
        ),
      );
    }),
  );
}
