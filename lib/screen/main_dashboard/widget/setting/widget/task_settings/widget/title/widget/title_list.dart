import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/other.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/task_settings/widget/title/widget/add_title.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

class TitleList extends StatelessWidget {
  const TitleList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Get.put(CUser());
    return Consumer<DashboardController>(
        builder: (context, value, child) => Container(
              alignment: Alignment.bottomCenter,
              // width: 300,
              height: 500.h,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Container(
                      // alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10.w, right: 20.w),
                      // height: 100.h,
                      child: const AddNewTitle()),
                  Expanded(
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6))),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        // height: 400.h,
                        child: value.selecteddepartement == ""
                            ? const SizedBox()
                            : StreamBuilder<DocumentSnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection(hotelListCollection)
                                    .doc(user.data.hotelid)
                                    .collection('Department')
                                    .doc(value.selecteddepartement)
                                    .snapshots(includeMetadataChanges: true),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return const Center(
                                      child: Text("No data found"),
                                    );
                                  }
                                  var list = (snapshot.data!.data()
                                      as Map<String, dynamic>)['title'] as List;
                                  if (list.isEmpty) {
                                    return const Center(
                                      child: Text("No data found"),
                                    );
                                  }
                                  return ListView.builder(
                                    itemCount: list.length,
                                    itemBuilder: (context, index) => Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              width: 170.w,
                                              child: Text(
                                                list[index],
                                                style: style18Normal,
                                              ),
                                            ),
                                            const Spacer(),
                                            Material(
                                              color: Colors.transparent,
                                              child: IconButton(
                                                  splashColor: Colors.grey,
                                                  splashRadius: 15,
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.delete_outlined,
                                                    size: 25.sp,
                                                    color: Colors.grey,
                                                  )),
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              child: IconButton(
                                                  splashColor: Colors.blue,
                                                  splashRadius: 15,
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    size: 15,
                                                    color: Colors.blue,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        const Divider()
                                      ],
                                    ),
                                  );
                                },
                              )),
                  ),
                ],
              ),
            ));
  }
}
