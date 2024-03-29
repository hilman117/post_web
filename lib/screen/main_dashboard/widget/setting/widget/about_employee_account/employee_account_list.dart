import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/models/user.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';

import 'package:provider/provider.dart';

import '../../../../../../../firebase/firebase_account.dart';

import 'widget/create_account/create_account.dart';
import 'widget/create_account/widget/delete_pop_up.dart';
import 'widget/edit_employee_profile/edit_employee_profile.dart';

class EmployeeAccountList extends StatelessWidget {
  const EmployeeAccountList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<List<UserDetails>>(context);
    final user = Get.put(CUser());
    final controllerSetting =
        Provider.of<SettingsController>(context, listen: false);
    final controllerAccount =
        Provider.of<FirebaseAccount>(context, listen: false);
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.h),
      child: Container(
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        height: 500.h,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(left: 15.w, right: 30.w, top: 5.h),
                height: 80.h,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Team Members",
                          style: TextStyle(
                              fontSize: 35.sp,
                              fontWeight: FontWeight.bold,
                              color: theme.canvasColor),
                        ),
                        Text(
                          user.data.hotel!,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                              color: theme.canvasColor),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 50.w,
                    ),
                    Consumer<FirebaseAccount>(
                      builder: (context, value, child) => Container(
                        alignment: Alignment.center,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: () async {
                            controllerAccount.statusSucces(false);
                            controllerSetting.clear();
                            createAccountDialog(
                              context,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor2),
                          child: Text(
                            "Add team member",
                            style:
                                TextStyle(fontSize: 15.sp, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                  ),
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        data.sort((a, b) => a.name!.compareTo(b.name!));
                        UserDetails employee = data[index];
                        if (data.isEmpty) {
                          return Center(
                            child: Text(
                              "No data",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: theme.canvasColor,
                                  fontWeight: FontWeight.normal),
                            ),
                          );
                        }
                        if (employee.hotel == user.data.hotel) {
                          return EmployeeTile(
                              employee: employee,
                              controllerAccount: controllerAccount);
                        }
                        return Center(
                          child: Text(
                            "Loading data...",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: theme.canvasColor,
                                fontWeight: FontWeight.normal),
                          ),
                        );
                      })),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}

class EmployeeTile extends StatelessWidget {
  const EmployeeTile({
    Key? key,
    required this.employee,
    required this.controllerAccount,
  }) : super(key: key);

  final UserDetails employee;
  final FirebaseAccount controllerAccount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Row(
        children: [
          SizedBox(
            width: 350.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employee.name!,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: theme.canvasColor,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  employee.email!,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: theme.canvasColor,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: 150.w,
            child: Text(
              employee.department!,
              style: TextStyle(
                  fontSize: 18.sp,
                  color: theme.canvasColor,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            width: 120.w,
            alignment: Alignment.center,
            child: Text(
              employee.accountType!,
              style: TextStyle(
                  fontSize: 18.sp,
                  color: theme.canvasColor,
                  fontStyle: FontStyle.italic),
            ),
          ),
          const Spacer(),
          TextButton(
              onPressed: () {
                controllerAccount.successTrueToFalse();
                deletePopUp(context, employee.name!, employee.email!);
              },
              child: const Text(
                "Delete",
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              )),
          TextButton(
              onPressed: () async {
                controllerAccount.clearEditProfile();
                await controllerAccount.getCurrentProfile(
                  currentName: employee.name!,
                  currentPosition: employee.position!,
                  currentEmail: employee.email!,
                  currentDepartement: employee.department!,
                );
                // ignore: use_build_context_synchronously
                editEmployeeProfile(context, employee);
              },
              child: const Text(
                "Edit",
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: mainColor),
              )),
        ],
      ),
    );
  }
}
