import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

import '../../controller_dashboard.dart';
import 'widget/filter_by_status.dart';
import 'widget/request_card.dart';
import 'widget/search_box.dart';
import 'widget/table_title.dart';

class RowTitle extends StatelessWidget {
  final BoxConstraints p1;
  final Stream<QuerySnapshot<Map<String, dynamic>>> streamTask;
  const RowTitle({
    Key? key,
    required this.p1,
    required this.streamTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DashboardController>(context, listen: false);
    // var tasks = Provider.of<List<TaskModel>>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 1850.w,
          // height: 900.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Consumer<DashboardController>(
                builder: (context, value, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 170,
                            child: Row(
                              children: [
                                Text(
                                  value.selectedDepartment >= 0
                                      ? value.department
                                      : "All Departement",
                                  style: GoogleFonts.sarabun(
                                      fontSize: 20.sp,
                                      // fontWeight: FontWeight.w700,
                                      color: Colors.blue),
                                ),
                                value.selectedDepartment >= 0 ||
                                        value.statusSelected >= 0
                                    ? SizedBox(
                                        height: 15.h,
                                        child: TextButton(
                                            onPressed: () =>
                                                controller.clearFilter(),
                                            child: Text(
                                              "Clear filter",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.blue),
                                            )),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2.5,
                            ),
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.5,
                                    spreadRadius: 0.5,
                                    offset: Offset(0.5, 0.5))
                              ],
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.grey.shade200,
                            ),
                            child: Row(
                              children: List.generate(
                                  value.status.length,
                                  (index) => InkWell(
                                        onTap: () => controller.selectStatus(
                                            index, value.status[index]),
                                        child: FilterByStatus(
                                          status: value.status[index],
                                          index: index,
                                        ),
                                      )),
                            ),
                          ),
                          const SearchBox()
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    //widget that showing title of the column
                    const TableTitle(),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 600.h,
                        child:
                            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          stream: streamTask,
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                  child: Text('Something went wrong'));
                            }
                            if (snapshot.data == null) {
                              return const CircularProgressIndicator.adaptive();
                            }
                            if (snapshot.data!.docs.isEmpty) {
                              return Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "image/empty-box.png",
                                      width: 200.w,
                                    ),
                                    Text(
                                      "Tak ada data",
                                      style: style15Normal,
                                    )
                                  ],
                                ),
                              );
                            }
                            List<QueryDocumentSnapshot<Object?>> list =
                                snapshot.data!.docs;
                            list.sort((a, b) => b["time"].compareTo(a["time"]));
                            return ListView.builder(
                                itemCount: list.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Map<String, dynamic> data = list[index]
                                      .data()! as Map<String, dynamic>;
                                  TaskModel taskModel =
                                      TaskModel.fromJson(data);
                                  return MouseRegion(
                                    onEnter: (event) => controller.hovering(
                                        cardRequestHover: true, index: index),
                                    onExit: (event) => controller.hovering(
                                        cardRequestHover: false),
                                    child: RequestCard(
                                      index: index,
                                      taskModel: taskModel,
                                    ),
                                  );
                                });
                          },
                        ))
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
