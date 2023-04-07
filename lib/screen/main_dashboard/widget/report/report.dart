import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/chart_bar/chart_bar_custom.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/header.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/history_request.dart';
import 'package:post_web/screen/main_dashboard/widget/report/widget/popular_location.dart';
import 'package:provider/provider.dart';

import '../../../../models/departement.dart';
import '../../../../models/task.dart';
import 'widget/general_pie_chart_report/general_pie_chart_box.dart';
import 'widget/title_box_counter.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ReportState();
}

class ReportState extends State {
  @override
  Widget build(BuildContext context) {
    final event = Provider.of<ReportController>(context, listen: false);
    final value = context.watch<ReportController>();
    var requestData = Provider.of<List<TaskModel>>(context);
    var data = Provider.of<List<Departement>>(context);
    var activeDepartement =
        data.where((element) => element.isActive == true).toList();
    return
        // value.result.isEmpty
        //     ? loadingWidget()
        //     :
        Container(
      color: const Color(0xffE8EEF8),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        children: [
          SizedBox(
            height: 60.h,
          ),
          headerWidget(
              context: context,
              listDepartement: activeDepartement,
              tasks: requestData),
          SizedBox(
            height: 60.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              customChartbar(
                  iconData: Icons.schedule_rounded,
                  timeRange: "At 0 - 23 PM",
                  context: context,
                  label: "Hourly Chart",
                  timeline: value.hourlyTimeLine),
              customChartbar(
                  onTap: () => event.showCaledar(context: context),
                  context: context,
                  label: "Daily Chart",
                  timeline: value.dailyTimeLine)
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              const GeneralPieChartBox(),
              titleBoxCounter(
                  iconData: Icons.all_inbox_rounded,
                  context: context,
                  boxLabel: "Request Departement",
                  label: "Title",
                  data: value.result),
              popularBoxCounter(
                  iconData: Icons.pin_drop_rounded,
                  context: context,
                  label: 'Location',
                  labelBox: 'Popular Location')
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
                  label: "Tile"),
              titleBoxCounter(
                  iconData: Icons.person,
                  context: context,
                  boxLabel: '10 Top Creators',
                  label: "Name",
                  data: value.result),
              popularBoxCounter(
                  iconData: Icons.check_rounded,
                  context: context,
                  label: 'Name',
                  labelBox: 'Top Receivers')
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          historyRequest(context),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
