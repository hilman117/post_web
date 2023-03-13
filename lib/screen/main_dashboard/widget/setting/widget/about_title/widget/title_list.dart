import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/firebase/firebase_title.dart';
import 'package:post_web/models/departement.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:provider/provider.dart';

import '../../../../../../../reusable_widget/notif_action_result.dart';
import 'add_title.dart';
import 'item_title.dart';

class TitleList extends StatelessWidget {
  const TitleList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrlSetting = context.watch<SettingsController>();
    final ctrlDasboard = context.watch<DashboardController>();
    return Stack(
      children: [
        Container(
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
                    child: ctrlDasboard.selecteddepartement == ""
                        ? const SizedBox()
                        : FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            future: FirebaseTitle()
                                .getTitle(ctrlDasboard.selecteddepartement),
                            builder: (context, snapshot) {
                              if (ctrlSetting.isLoadingLoadTitle) {
                                return const Center(
                                  child: CircularProgressIndicator.adaptive(
                                    backgroundColor: mainColor2,
                                    strokeWidth: 2,
                                  ),
                                );
                              }
                              if (snapshot.data == null) {
                                return const Center(
                                  child: Text("No data found"),
                                );
                              }

                              Departement data =
                                  Departement.fromJson(snapshot.data!.data()!);
                              data.title!.sort(
                                (a, b) {
                                  return a.compareTo(b);
                                },
                              );
                              if (data.title!.isEmpty) {
                                return const Center(
                                  child: Text("No data found"),
                                );
                              }
                              return ListView.builder(
                                  itemCount: data.title!.length,
                                  itemBuilder: (context, index) {
                                    var title = data.title![index];
                                    if (ctrlSetting.searchTitle == "") {
                                      return ItemTitle(
                                        title: title,
                                        currentList: data.title!,
                                        index: index,
                                      );
                                    }
                                    if (title.toString().toLowerCase().contains(
                                        ctrlSetting.searchTitle
                                            .toLowerCase())) {
                                      return ItemTitle(
                                        title: title,
                                        currentList: data.title!,
                                        index: index,
                                      );
                                    }
                                    return const SizedBox();
                                  });
                            },
                          )),
              ),
            ],
          ),
        ),
        //widget that will pop up when success to add new title
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeOutSine,
          switchOutCurve: Curves.easeOutSine,
          child: ctrlSetting.succedTitleAdded || ctrlSetting.succedTitleRemoved
              ? Center(
                  child: NotifActionResult(
                      text: ctrlSetting.succedTitleAdded &&
                              ctrlSetting.succedTitleRemoved == false
                          ? "New title success added"
                          : "Removed success"),
                )
              : const SizedBox(),
        )
      ],
    );
  }
}
