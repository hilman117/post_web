import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/firebase/firebase_title.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/create_task_dialog/controller/controller_create_task.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../models/departement.dart';

class PopUpTitle extends StatelessWidget {
  const PopUpTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final valueDashboard = context.watch<DashboardController>();
    final valueCreate = context.watch<CreateController>();
    return Material(
      child: LimitedBox(
        maxHeight: 300.h,
        child: Container(
          width: 320.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 0.5,
                  spreadRadius: 0.5,
                  offset: const Offset(0.5, 0.5))
            ],
          ),
          child: valueDashboard.selecteddepartement != ""
              ? FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: FirebaseTitle()
                      .getTitle(valueDashboard.selecteddepartement),
                  builder: (context, snapshot) {
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
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        itemCount: data.title!.length,
                        itemBuilder: (context, index) {
                          var title = data.title![index];
                          if (valueCreate.searchingText == "") {
                            return ItemTitle(title: title);
                          }
                          if (title.toString().toLowerCase().contains(
                              valueCreate.searchingText.toLowerCase())) {
                            return ItemTitle(title: title);
                          }
                          return const SizedBox();
                        });
                  },
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}

class ItemTitle extends StatefulWidget {
  const ItemTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<ItemTitle> createState() => _ItemTitleState();
}

class _ItemTitleState extends State<ItemTitle> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: Container(
        height: 35.h,
        decoration: BoxDecoration(
            color: isHover ? Colors.grey.shade200 : Colors.transparent,
            border:
                Border(bottom: BorderSide(width: 0.5.w, color: Colors.grey))),
        padding: EdgeInsets.all(5.sp),
        child: Text(
          widget.title,
          style: style18Normal,
        ),
      ),
    );
  }
}
