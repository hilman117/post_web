import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/firebase/firebase_location.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/about_location/widget/add_location.dart';
import 'package:provider/provider.dart';
import 'widget/location_item.dart';

Widget locationSection(BuildContext context) {
  final theme = Theme.of(context);
  return Container(
    alignment: Alignment.bottomCenter,
    width: 300.w,
    height: 300.h,
    decoration: BoxDecoration(
        color: theme.primaryColor, borderRadius: BorderRadius.circular(25.r)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const AddNewLocation(),
          Consumer<SettingsController>(
            builder: (context, value, child) => Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(6),
                          bottomRight: Radius.circular(6))),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    future: FirebaseLocation().getHotelData(),
                    builder: (context, snapshot) {
                      if (value.isLoadingLoadLocation) {
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
                      var list = snapshot.data!.data()!['location'] as List;
                      if (list.isEmpty) {
                        return const Center(
                          child: Text("No data found"),
                        );
                      }
                      list.sort(
                        (a, b) {
                          return a.compareTo(b);
                        },
                      );
                      return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            list.sort(
                              (a, b) {
                                return a.compareTo(b);
                              },
                            );
                            if (value.isLoadingLoadLocation) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: mainColor2,
                                  strokeWidth: 2.0,
                                ),
                              );
                            }
                            if (list.isEmpty) {
                              return const Center(
                                child: Text("No Data"),
                              );
                            }
                            if (value.searchLocation == "") {
                              return LocationItem(
                                location: list[index],
                                currentLocationList: list,
                                indexToRemove: index,
                              );
                            }
                            if (list[index]
                                .toString()
                                .toLowerCase()
                                .contains(value.searchLocation.toLowerCase())) {
                              return LocationItem(
                                location: list[index],
                                currentLocationList: list,
                                indexToRemove: index,
                              );
                            }
                            return const SizedBox();
                          });
                    },
                  )),
            ),
          )
        ],
      ),
    ),
  );
}
