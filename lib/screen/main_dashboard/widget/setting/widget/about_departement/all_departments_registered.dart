import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/models/departement.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

import 'widget/add_departments.dart';

class AllDepartmentRegistered extends StatelessWidget {
  const AllDepartmentRegistered({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<List<Departement>>(context);
    final settingController =
        Provider.of<SettingsController>(context, listen: false);
    return Consumer<SettingsController>(
        builder: (context, value, child) => Container(
              // margin: EdgeInsets.only(left: 100.w),
              alignment: Alignment.bottomCenter,
              // width: 500.w,
              height: 500.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const AddNewDepartement(),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(7),
                            bottomRight: Radius.circular(7)),
                      ),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      // height: 170.h,
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          Departement departement = data[index];

                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10.0.w),
                                child: departement.departement == ""
                                    ? const SizedBox()
                                    : Row(
                                        children: [
                                          Image.asset(
                                            departement.departementIcon!,
                                            width: 25.w,
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            width: 200.w,
                                            // height: 20.h,
                                            child: Text(
                                              departement.departement!,
                                              style: style18Normal,
                                            ),
                                          ),
                                          const Spacer(),
                                          Transform.scale(
                                            scale: 0.5,
                                            child: Switch.adaptive(
                                              value: departement.isActive!,
                                              onChanged: (value) =>
                                                  settingController
                                                      .activateSwith(
                                                          context,
                                                          departement
                                                              .departement!,
                                                          value),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () => settingController
                                                .removeDepartement(context,
                                                    departement.departement!),
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.grey,
                                              size: 30.sp,
                                            ),
                                          )
                                        ],
                                      ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
