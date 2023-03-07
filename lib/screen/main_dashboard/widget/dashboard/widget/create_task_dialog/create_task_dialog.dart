import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:post_web/const.dart';
import 'package:provider/provider.dart';

import 'controller/controller_create_task.dart';
import 'widget/task_request/task.dart';

createDialog(BuildContext context, TabController tabController) {
  final size = MediaQuery.of(context).size;

  return showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    animationType: DialogTransitionType.slideFromBottom,
    curve: Curves.fastOutSlowIn,
    duration: const Duration(milliseconds: 500),
    builder: (BuildContext context) {
      return CustomDialog(
          child: Consumer<CreateController>(
        builder: (context, value, child) => Container(
          // alignment: Alignment.bottomCenter,
          height: size.height * 0.7,
          width: size.width * 0.5,
          decoration: BoxDecoration(
            color: mainColor.withOpacity(0.2),
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Create",
                      style: TextStyle(color: mainColor, fontSize: 10),
                    ),
                    Icon(
                      Icons.close_rounded,
                      size: size.width * 0.01,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    width: size.width * 0.5,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: LayoutBuilder(
                      builder: (p0, p1) => Column(children: [
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: p1.maxWidth * 0.01,
                                vertical: p1.maxWidth * 0.01),
                            height: p1.maxHeight * 0.06,
                            width: p1.maxWidth * 0.5,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 0.5,
                                      spreadRadius: 0.5,
                                      offset: Offset(0.5, 0.5))
                                ],
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade200),
                            child: TabBar(
                                indicator: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                indicatorColor: mainColor,
                                unselectedLabelColor: Colors.grey,
                                labelColor: mainColor,
                                labelStyle:
                                    TextStyle(fontSize: p1.maxWidth * 0.015),
                                // isScrollable: true,
                                controller: tabController,
                                tabs: const [
                                  Tab(
                                    text: "Task/ Request",
                                  ),
                                  Tab(
                                    text: "Lost & Found",
                                  ),
                                ])),
                        Expanded(
                          child: SizedBox(
                            width: p1.maxWidth,
                            child: TabBarView(
                                controller: tabController,
                                children: [
                                  Task(p1: p1),
                                  const Center(child: Text("lost and found"))
                                ]),
                          ),
                        )
                      ]),
                    )),
              ),
            ],
          ),
        ),
      ));
    },
  );
}
