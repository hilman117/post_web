import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../controller_settings.dart';

class AddNewLocation extends StatefulWidget {
  const AddNewLocation({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNewLocation> createState() => _AddNewLocationState();
}

class _AddNewLocationState extends State<AddNewLocation> {
  TextEditingController searchLocation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SettingsController>(context, listen: false);
    // final locationName = TextEditingController();
    // final theme = Theme.of(context);
    return Consumer<SettingsController>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Location",
            style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              SizedBox(
                  // height: 35.h,
                  width: 400.w,
                  child: CupertinoSearchTextField(
                    onChanged: (value) => controller.searchingTitle(value),
                    // suffixIcon: const Icon(CupertinoIcons.search),
                    style: TextStyle(fontSize: 20.sp),
                    placeholderStyle: TextStyle(fontSize: 20.sp),
                  )),
              CupertinoButton(
                child: Row(
                  children: [
                    Text(
                      "Add Location",
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
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
