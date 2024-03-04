import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:post_web/models/title_model.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/about_title/widget/pop_add_title.dart';
import 'package:provider/provider.dart';

Widget titleSettings(BuildContext context) {
  final settingController =
      Provider.of<SettingsController>(context, listen: false);

  return Consumer<SettingsController>(builder: (context, value, child) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r), color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Title",
                style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  SizedBox(
                      // height: 35.h,
                      width: 400.w,
                      child: CupertinoSearchTextField(
                        onChanged: (value) =>
                            settingController.searchingTitle(value),
                        // suffixIcon: const Icon(CupertinoIcons.search),
                        style: TextStyle(fontSize: 20.sp),
                        placeholderStyle: TextStyle(fontSize: 20.sp),
                      )),
                  CupertinoButton(
                    child: Row(
                      children: [
                        Text(
                          "Add Title",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.blue),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          CupertinoIcons.add,
                          color: Colors.blue,
                          size: 20.sp,
                        )
                      ],
                    ),
                    onPressed: () => popAddTitle(context),
                  ),
                ],
              )
            ],
          ),
          Consumer2<MainDashboardController, SettingsController>(
            builder: (context, value, value2, child) {
              return Expanded(
                child: SizedBox(
                  child: ListView.builder(
                      itemCount: value.titles.length,
                      itemBuilder: (context, index) {
                        TitlesModel title = value.titles[index];
                        if (title.title!
                                .toLowerCase()
                                .contains(value2.searchTitle.toLowerCase()) ||
                            title.family!
                                .toLowerCase()
                                .contains(value2.searchTitle.toLowerCase())) {
                          return CupertinoListTile(
                            trailing: const Row(
                              children: [],
                            ),
                            title: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              child: Text(
                                title.title!,
                                style: TextStyle(
                                    fontSize: 18.sp, color: Colors.black),
                              ),
                            ),
                            subtitle: Text(
                              title.family!,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                          );
                        }
                        return const SizedBox();
                      }),
                ),
              );
            },
          )
        ],
      ),
    );
  });
}
