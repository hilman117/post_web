import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:post_web/const.dart';
import 'package:post_web/reusable_widget/custom_calendar/custom_calendar.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/chart_bar/chart_bar_custom.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/chart_bar/widget/widget/hourly_chart/custom_hourly_chart.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/filter_menu.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/header.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/history_request.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/popular_location.dart';
import 'package:provider/provider.dart';
import '../../../../models/user.dart';
import 'widget/filter_tag.dart';
import 'widget/general_pie_chart_report/general_pie_chart_box.dart';
import 'widget/title_box_counter.dart';
import '../../../../models/departement.dart';

class Report extends StatefulWidget {
  const Report({
    Key? key,
    required this.listDept,
  }) : super(key: key);
  final List<Departement> listDept;
  @override
  State<StatefulWidget> createState() => ReportState();
}

class ReportState extends State<Report> {
  FocusNode focusApply = FocusNode();

  @override
  void initState() {
    Future.microtask(() {
      Provider.of<ReportController>(context, listen: false).getMasterDataTask(
          context: context,
          generalData:
              Provider.of<MainDashboardController>(context, listen: false)
                  .data!,
          listDept: widget.listDept);
    });
    focusApply.addListener(() {
      Provider.of<ReportController>(context, listen: false)
          .getFocusNode(applyFocus: focusApply.hasFocus);
    });
    super.initState();
  }

  @override
  void dispose() {
    focusApply.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final event = Provider.of<ReportController>(context, listen: false);
    var data = Provider.of<List<UserDetails>>(context);
    return Consumer2<ReportController, DashboardController>(
        builder: (context, value, value2, child) {
      String dateStart = value.rangeStart == null
          ? ""
          : DateFormat("dd/MM/yy").format(value.rangeStart!);
      String dateEnd = value.rangeEnd == null
          ? ""
          : DateFormat("dd/MM/yy").format(value.rangeEnd!);
      return GestureDetector(
        onTap: () {
          if (focusApply.hasFocus) {
            focusApply.unfocus();
          }
        },
        child: Stack(
          children: [
            Container(
              color: theme.scaffoldBackgroundColor,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  headerWidget(context: context),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 40.h,
                              margin: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 15.w),
                              child: Text(
                                value.onSelectedDay == null
                                    ? ""
                                    : DateFormat("dd/MM/yy")
                                        .format(value.onSelectedDay!),
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.normal),
                              )),
                          SizedBox(
                            width: 650.w,
                            child: Builder(builder: (context) {
                              return customHourlyChartbar(
                                  iconData: Icons.timelapse,
                                  context: context,
                                  label: "Hourly Chart",
                                  timeline: value.resultHourlyData,
                                  timeRange: "00 - 23");
                            }),
                          ),
                        ],
                      ),
                      Builder(builder: (context) {
                        String startDate = value.rangeStart == null
                            ? ""
                            : DateFormat("MMM dd").format(value.rangeStart!);
                        String endDate = value.rangeEnd == null
                            ? ""
                            : DateFormat("MMM dd").format(value.rangeEnd!);
                        return Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 20.h, horizontal: 15.w),
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Filter by range date",
                                      style: TextStyle(
                                          color: theme.canvasColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20.sp),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    InkWell(
                                      onTap: () => customCalendar(context),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 40.h,
                                        width: 220.w,
                                        padding: EdgeInsets.all(8.sp),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 1.w,
                                                color: Colors.grey.shade300)),
                                        child: Text(
                                          "$dateStart to $dateEnd",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 20.sp),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.sp,
                                    ),
                                    if (value.selectedDept.isNotEmpty)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          //user search field start here
                                          SizedBox(
                                            width: 200.w,
                                            child: Autocomplete<UserDetails>(
                                              optionsViewBuilder: (context,
                                                  onSelected, options) {
                                                return Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                    child: ConstrainedBox(
                                                      constraints:
                                                          BoxConstraints(
                                                              maxHeight: 300.h,
                                                              maxWidth: 300.w),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                  offset: Offset(
                                                                      0.0, 0.0),
                                                                  spreadRadius:
                                                                      0.5,
                                                                  blurRadius:
                                                                      0.5,
                                                                  color:
                                                                      mainColor)
                                                            ],
                                                            color:
                                                                theme.cardColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.r)),
                                                        child: ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              options.length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            final UserDetails
                                                                option = options
                                                                    .elementAt(
                                                                        index);
                                                            return InkWell(
                                                              onTap: () {
                                                                onSelected(
                                                                    option);
                                                              },
                                                              child: Builder(builder:
                                                                  (BuildContext
                                                                      context) {
                                                                final bool
                                                                    highlight =
                                                                    AutocompleteHighlightedOption.of(
                                                                            context) ==
                                                                        index;
                                                                if (highlight) {
                                                                  SchedulerBinding
                                                                      .instance
                                                                      .addPostFrameCallback(
                                                                          (Duration
                                                                              timeStamp) {
                                                                    Scrollable.ensureVisible(
                                                                        context,
                                                                        alignment:
                                                                            0.5);
                                                                  });
                                                                }
                                                                return Container(
                                                                  color: highlight
                                                                      ? Theme.of(
                                                                              context)
                                                                          .focusColor
                                                                      : null,
                                                                  padding: EdgeInsets
                                                                      .all(16.0
                                                                          .sp),
                                                                  child: Text(
                                                                    option
                                                                        .name!,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        color: theme
                                                                            .canvasColor),
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
                                              displayStringForOption:
                                                  (option) => option.name!,
                                              optionsBuilder: (TextEditingValue
                                                  textEditingValue) {
                                                return data.where(
                                                    (UserDetails option) {
                                                  return option.name!
                                                          .toString()
                                                          .toLowerCase()
                                                          .contains(textEditingValue
                                                              .text
                                                              .toString()
                                                              .toLowerCase()) &&
                                                      option.department ==
                                                          value.departement!
                                                              .departement;
                                                });
                                              },
                                              fieldViewBuilder: (context,
                                                  textEditingController,
                                                  focusNode,
                                                  onFieldSubmitted) {
                                                return filterMenu(
                                                    context: context,
                                                    focusNode: focusNode,
                                                    label: "User",
                                                    controllertext:
                                                        textEditingController);
                                              },
                                              onSelected:
                                                  (UserDetails selection) {
                                                event.selectUserName(
                                                    selection.name!);
                                              },
                                            ),
                                          ),
                                          //user search field end here
                                          //title search field start here
                                          SizedBox(
                                            width: 200.w,
                                            child: Autocomplete<String>(
                                              optionsViewBuilder: (context,
                                                  onSelected, options) {
                                                return Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                    child: ConstrainedBox(
                                                      constraints:
                                                          BoxConstraints(
                                                              maxHeight: 300.h,
                                                              maxWidth: 300.w),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                  offset: Offset(
                                                                      0.0, 0.0),
                                                                  spreadRadius:
                                                                      0.5,
                                                                  blurRadius:
                                                                      0.5,
                                                                  color:
                                                                      mainColor)
                                                            ],
                                                            color:
                                                                theme.cardColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.r)),
                                                        child: ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              options.length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            final String
                                                                option = options
                                                                    .elementAt(
                                                                        index);
                                                            return InkWell(
                                                              onTap: () {
                                                                onSelected(
                                                                    option);
                                                              },
                                                              child: Builder(builder:
                                                                  (BuildContext
                                                                      context) {
                                                                final bool
                                                                    highlight =
                                                                    AutocompleteHighlightedOption.of(
                                                                            context) ==
                                                                        index;
                                                                if (highlight) {
                                                                  SchedulerBinding
                                                                      .instance
                                                                      .addPostFrameCallback(
                                                                          (Duration
                                                                              timeStamp) {
                                                                    Scrollable.ensureVisible(
                                                                        context,
                                                                        alignment:
                                                                            0.5);
                                                                  });
                                                                }
                                                                return Container(
                                                                  color: highlight
                                                                      ? Theme.of(
                                                                              context)
                                                                          .focusColor
                                                                      : null,
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          16.0),
                                                                  child: Text(
                                                                    option,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        color: theme
                                                                            .canvasColor),
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
                                              displayStringForOption:
                                                  (option) => option,
                                              optionsBuilder: (TextEditingValue
                                                  textEditingValue) {
                                                return value.departement!.title!
                                                    .where((String option) {
                                                  return option
                                                      .toString()
                                                      .toLowerCase()
                                                      .contains(textEditingValue
                                                          .text
                                                          .toString()
                                                          .toLowerCase());
                                                });
                                              },
                                              fieldViewBuilder: (context,
                                                  textEditingController,
                                                  focusNode,
                                                  onFieldSubmitted) {
                                                return filterMenu(
                                                    context: context,
                                                    focusNode: focusNode,
                                                    label: "Title",
                                                    controllertext:
                                                        textEditingController);
                                              },
                                              onSelected: (String selection) {
                                                event.selectTitle(selection);
                                              },
                                            ),
                                          ),
                                          //location search field starts here
                                          SizedBox(
                                            width: 200.w,
                                            child: Autocomplete<String>(
                                              optionsViewBuilder: (context,
                                                  onSelected, options) {
                                                return Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                    child: ConstrainedBox(
                                                      constraints:
                                                          BoxConstraints(
                                                              maxHeight: 300.h,
                                                              maxWidth: 300.w),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                  offset: Offset(
                                                                      0.0, 0.0),
                                                                  spreadRadius:
                                                                      0.5,
                                                                  blurRadius:
                                                                      0.5,
                                                                  color:
                                                                      mainColor)
                                                            ],
                                                            color:
                                                                theme.cardColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.r)),
                                                        child: ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              options.length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            final String
                                                                option = options
                                                                    .elementAt(
                                                                        index);
                                                            return InkWell(
                                                              onTap: () {
                                                                onSelected(
                                                                    option);
                                                              },
                                                              child: Builder(builder:
                                                                  (BuildContext
                                                                      context) {
                                                                final bool
                                                                    highlight =
                                                                    AutocompleteHighlightedOption.of(
                                                                            context) ==
                                                                        index;
                                                                if (highlight) {
                                                                  SchedulerBinding
                                                                      .instance
                                                                      .addPostFrameCallback(
                                                                          (Duration
                                                                              timeStamp) {
                                                                    Scrollable.ensureVisible(
                                                                        context,
                                                                        alignment:
                                                                            0.5);
                                                                  });
                                                                }
                                                                return Container(
                                                                  color: highlight
                                                                      ? Theme.of(
                                                                              context)
                                                                          .focusColor
                                                                      : null,
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          16.0),
                                                                  child: Text(
                                                                    option,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        color: theme
                                                                            .canvasColor),
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
                                              displayStringForOption:
                                                  (option) => option,
                                              optionsBuilder: (TextEditingValue
                                                  textEditingValue) {
                                                List<String> locations =
                                                    value.hotelData!.location!;
                                                return locations
                                                    .where((String option) {
                                                  return option
                                                      .toString()
                                                      .toLowerCase()
                                                      .contains(textEditingValue
                                                          .text
                                                          .toString()
                                                          .toLowerCase());
                                                });
                                              },
                                              fieldViewBuilder: (context,
                                                  textEditingController,
                                                  focusNode,
                                                  onFieldSubmitted) {
                                                return filterMenu(
                                                    context: context,
                                                    focusNode: focusNode,
                                                    label: "Location",
                                                    controllertext:
                                                        textEditingController);
                                              },
                                              onSelected: (String selection) {
                                                event.selectLocation(selection);
                                              },
                                            ),
                                          ),
                                          //location search field end here
                                          AnimatedContainer(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5.sp),
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset: const Offset(
                                                            0.0, 0.0),
                                                        spreadRadius: 1,
                                                        blurRadius: 1,
                                                        color: value
                                                                .getFocusApply
                                                            ? mainColor
                                                            : Colors
                                                                .transparent)
                                                  ]),
                                              height: 40.h,
                                              width: 180.w,
                                              child: ElevatedButton(
                                                  focusNode: focusApply,
                                                  onFocusChange: (value) =>
                                                      event.getFocusNode(
                                                          applyFocus: value),
                                                  onPressed: () => event.reloadDataFilter(
                                                      context: context,
                                                      listDept: widget.listDept,
                                                      generalData:
                                                          Provider.of<MainDashboardController>(context, listen: false)
                                                              .data!),
                                                  style: ElevatedButton.styleFrom(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(8.r)),
                                                      backgroundColor: mainColor),
                                                  child: Text(
                                                    "Apply",
                                                    style: TextStyle(
                                                        fontSize: 20.sp,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  )))
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                              customChartbar(
                                  context: context,
                                  label: "Daily Chart",
                                  timeline: value.resultData,
                                  timeRange: "$startDate - $endDate"),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 30.h,
                    margin: EdgeInsets.only(top: 20.sp),
                    child: value.onSelectedDay != null
                        ? Row(
                            children: [
                              Text(
                                "Displaying data on ${DateFormat("EEE, dd-MM-yy").format(value.onSelectedDay!)}",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              GestureDetector(
                                onTap: () => event
                                    .clearOnSelectedDay()
                                    .whenComplete(() => event.reloadDataFilter(
                                        context: context,
                                        listDept: widget.listDept,
                                        generalData: Provider.of<
                                                    MainDashboardController>(
                                                context,
                                                listen: false)
                                            .data!)),
                                child: Icon(
                                  Icons.cancel_rounded,
                                  size: 18.sp,
                                ),
                              )
                            ],
                          )
                        : const SizedBox(),
                  ),
                  Row(
                    children: [
                      GeneralPieChartBox(
                        listPieData: value.pieChartSource,
                      ),
                      titleBoxCounter(
                          item: "title",
                          lengthData: value.result.length,
                          iconData: Icons.all_inbox_rounded,
                          context: context,
                          boxLabel: "Request Departement",
                          label: "Title",
                          data: value.result),
                      popularBoxCounter(
                          iconData: Icons.pin_drop_rounded,
                          context: context,
                          label: 'Location',
                          labelBox: 'Popular Location',
                          data: value.dataPopularLocation)
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      popularBoxCounter(
                          iconData: Icons.bar_chart_rounded,
                          withSearchBox: true,
                          width: 700.w,
                          context: context,
                          labelBox: "Popular Title",
                          label: "Tile",
                          data: value.dataPopularTitle),
                      titleBoxCounter(
                          lengthData: value.listTopCreator.length < 10
                              ? value.listTopCreator.length
                              : 10,
                          iconData: Icons.person,
                          context: context,
                          boxLabel: '10 Top Creators',
                          label: "Name",
                          data: value.listTopCreator,
                          item: 'name'),
                      popularBoxCounter(
                          iconData: Icons.check_rounded,
                          context: context,
                          label: 'Name',
                          labelBox: 'Top Receivers',
                          data: value.dataTopReceiver)
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  historyRequest(context),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FilterTag(
                  topPosition: value.selectedDept == "" ? 50.w : 0,
                  labelTag: value.selectedDept,
                  opacity: value.selectedDept != "" ? 1.0 : 0.0,
                  onPressed: () async {
                    await event.clearFilter(isDeptCleared: true);

                    // ignore: use_build_context_synchronously
                    event.hoverOnStickChart().whenComplete(() =>
                        event.reloadDataFilter(
                            context: context,
                            listDept: widget.listDept,
                            // ignore: use_build_context_synchronously
                            generalData: Provider.of<MainDashboardController>(
                                    context,
                                    listen: false)
                                .data!));
                  },
                ),
                FilterTag(
                  topPosition: value.selectedUserName == "" ? 50.w : 0,
                  labelTag: value.selectedUserName,
                  opacity: value.selectedUserName != "" ? 1.0 : 0.0,
                  onPressed: () async {
                    await event.clearFilter(isUserNameCleared: true);
                    // ignore: use_build_context_synchronously
                    event.hoverOnStickChart().whenComplete(() =>
                        event.reloadDataFilter(
                            context: context,
                            listDept: widget.listDept,
                            // ignore: use_build_context_synchronously
                            generalData: Provider.of<MainDashboardController>(
                                    context,
                                    listen: false)
                                .data!));
                  },
                ),
                FilterTag(
                  topPosition: value.selectedLocation == "" ? 50.h : 0,
                  labelTag: value.selectedLocation,
                  opacity: value.selectedLocation != "" ? 1.0 : 0.0,
                  onPressed: () async {
                    await event.clearFilter(isLocationCleared: true);
                    // ignore: use_build_context_synchronously
                    event.hoverOnStickChart().whenComplete(() =>
                        event.reloadDataFilter(
                            context: context,
                            listDept: widget.listDept,
                            // ignore: use_build_context_synchronously
                            generalData: Provider.of<MainDashboardController>(
                                    context,
                                    listen: false)
                                .data!));
                  },
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
