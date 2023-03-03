import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/models/general_data.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/about_location/widget/add_location.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

class AllLocation extends StatelessWidget {
  const AllLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<GeneralData>(context);
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
                      itemCount: data.location?.length,
                      itemBuilder: (context, index) {
                        data.location?.sort(
                          (a, b) {
                            return a.compareTo(b);
                          },
                        );
                        if (data.location == null) {
                          return const Center(
                            child: Text("No Data"),
                          );
                        }
                        if (value.searchLocation == " ") {
                          return LocationItem(location: data.location![index]);
                        }
                        if (data.location![index]
                            .toString()
                            .toLowerCase()
                            .contains(value.searchLocation.toLowerCase())) {
                          return LocationItem(location: data.location![index]);
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

class LocationItem extends StatelessWidget {
  const LocationItem({
    Key? key,
    required this.location,
  }) : super(key: key);

  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 170.w,
              child: Text(
                location,
                style: style18Normal,
              ),
            ),
            const Spacer(),
            Material(
              color: Colors.transparent,
              child: IconButton(
                  splashColor: Colors.grey,
                  splashRadius: 15.sp,
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
                  splashRadius: 15.sp,
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    size: 25.sp,
                    color: Colors.blue,
                  )),
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
