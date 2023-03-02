import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/models/user.dart';
import 'package:post_web/other.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:post_web/style.dart';
import 'package:post_web/reusable_widget/photo_profile.dart';
import 'package:provider/provider.dart';

import '../../../../../../../firebase/firebase_account.dart';
import '../search_field_setting.dart';
import 'widget/create_account/create_account.dart';
import 'widget/create_account/widget/delete_pop_up.dart';
import 'widget/edit_employee_profile/edit_employee_profile.dart';

class EmployeeAccountList extends StatefulWidget {
  const EmployeeAccountList({Key? key}) : super(key: key);

  @override
  State<EmployeeAccountList> createState() => _EmployeeAccountListState();
}

class _EmployeeAccountListState extends State<EmployeeAccountList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Get.put(CUser());
    final controllerSetting =
        Provider.of<SettingsController>(context, listen: false);
    final controllerAccount =
        Provider.of<FirebaseAccount>(context, listen: false);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Container(
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        height: 300.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          //   boxShadow: [
          //     BoxShadow(
          //       color: Colors.grey.withOpacity(0.5),
          //       spreadRadius: 2,
          //       blurRadius: 3,
          //       offset: const Offset(0, 0), // changes position of shadow
          //     ),
          //   ],
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
                          style: style18Bold,
                        ),
                        Text(
                          user.data.hotel!,
                          style: style15Normal,
                        ),
                      ],
                    ),
                    const Spacer(),
                    const SearchFieldSettings(),
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
                          child: Text(
                            "Add team member",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor2),
                        ),
                      ),
                    )
                  ],
                )),
            Container(
                width: double.infinity,
                height: 420.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .where("hotel", isEqualTo: user.data.hotel)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      // if (snapshot.connectionState ==
                      //     ConnectionState.active) {
                      //   return const Center(
                      //     child: CircularProgressIndicator.adaptive(),
                      //   );
                      // }
                      if (snapshot.data == null) {
                        return const Center(
                          child: Text("No Data"),
                        );
                      }
                      List<QueryDocumentSnapshot<Map<String, dynamic>>>
                          employeeList = snapshot.data!.docs;
                      employeeList
                          .sort((a, b) => b["name"].compareTo(a["name"]));
                      return ListView.builder(
                          itemCount: employeeList.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> dataEmployee =
                                employeeList[index].data();
                            UserDetails employee =
                                UserDetails.fromJson(dataEmployee);
                            return ListTile(
                              title: Row(
                                children: [
                                  PhotoProfile(
                                      lebar: 25.w,
                                      tinggi: 25.h,
                                      radius: 25.sp,
                                      urlImage: employee.profileImage!),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  SizedBox(
                                    width: 350.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          employee.name!,
                                          style: style18Normal,
                                        ),
                                        Text(
                                          employee.email!,
                                          style: style18Normal,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 150.w,
                                    child: Text(
                                      employee.department!,
                                      style: style18Normal,
                                    ),
                                  ),
                                  Container(
                                    width: 120.w,
                                    alignment: Alignment.center,
                                    child: Text(
                                      employee.accountType!,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.black87,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                      onPressed: () {
                                        controllerAccount.successTrueToFalse();
                                        deletePopUp(context, employee.name!,
                                            employee.email!);
                                      },
                                      child: const Text(
                                        "Delete",
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        controllerAccount.clearEditProfile();
                                        controllerAccount.getCurrentProfile(
                                          currentName: employee.name!,
                                          currentPosition: employee.position!,
                                          currentEmail: employee.email!,
                                          currentDepartement:
                                              employee.department!,
                                        );
                                        editEmployeeProfile(context, employee);
                                      },
                                      child: Text(
                                        "Edit",
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: mainColor),
                                      )),
                                ],
                              ),
                            );
                          });
                    })),
          ],
        ),
      ),
    );
  }
}
