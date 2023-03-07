import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/models/general_data.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/about_location/widget/add_location.dart';
import 'package:provider/provider.dart';

import 'widget/location_item.dart';

class AllLocation extends StatelessWidget {
  const AllLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<GeneralData?>(context);
    return Container(
      alignment: Alignment.bottomCenter,
      width: 300.w,
      height: 300.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
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
                  child: ListView.builder(
                      itemCount: data!.location!.length,
                      itemBuilder: (context, index) {
                        data.location!.sort(
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
                        if (data.location == null) {
                          return const Center(
                            child: Text("No Data"),
                          );
                        }
                        if (value.searchLocation == "") {
                          return LocationItem(
                            location: data.location![index],
                            currentLocationList: data.location!,
                            indexToRemove: index,
                          );
                        }
                        if (data.location![index]
                            .toString()
                            .toLowerCase()
                            .contains(value.searchLocation.toLowerCase())) {
                          return LocationItem(
                            location: data.location![index],
                            currentLocationList: data.location!,
                            indexToRemove: index,
                          );
                        }
                        return const SizedBox();
                      })),
            ),
          )
        ],
      ),
    );
  }
}
