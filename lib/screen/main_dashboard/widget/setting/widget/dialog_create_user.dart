import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/firebase/firebase_account.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:provider/provider.dart';

import '../../../../../reusable_widget/button.dart';

craeteUser(BuildContext context) {
  final theme = Theme.of(context);
  final controller = Provider.of<FirebaseAccount>(context, listen: false);
  final settingController =
      Provider.of<SettingsController>(context, listen: false);
  TextEditingController name = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: FittedBox(
          child: Container(
            width: 350.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: theme.cardColor),
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Consumer2<SettingsController, MainDashboardController>(
                  builder: (context, value, value2, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                          hintText: "Full name",
                          hintStyle: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 5.sp,
                            vertical: 0,
                          ),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                      autofocus: true,
                      cursorHeight: 15.h,
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 10.sp),
                    TextFormField(
                      controller: position,
                      decoration: InputDecoration(
                          hintText: "Position",
                          hintStyle: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 5.sp,
                            vertical: 0,
                          ),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                      autofocus: true,
                      cursorHeight: 15.h,
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 10.sp),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 5.sp,
                                  vertical: 0,
                                ),
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide(width: 1))),
                            autofocus: true,
                            cursorHeight: 15.h,
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.normal),
                          ),
                        ),
                        Expanded(
                            child: Text(
                          value2.data!.domain!,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ))
                      ],
                    ),
                    SizedBox(height: 10.sp),
                    DropdownMenu<String>(
                      label: Text("Account type",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey)),
                      expandedInsets: const EdgeInsets.all(0),
                      inputDecorationTheme: const InputDecorationTheme(),
                      textStyle: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.normal),
                      dropdownMenuEntries: value.accountType
                          .map((e) =>
                              DropdownMenuEntry<String>(value: e, label: e))
                          .toList(),
                      onSelected: (val) =>
                          settingController.selectAccountType(val!),
                    ),
                    SizedBox(height: 10.sp),
                    TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 5.sp,
                            vertical: 0,
                          ),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                      autofocus: true,
                      cursorHeight: 15.h,
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 10.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonCustom(
                            isEnable: false,
                            height: 25.h,
                            widht: 70.w,
                            fontSize: 13.sp,
                            onPressed: () => Navigator.of(context).pop(),
                            buttonLabel: "Cancel"),
                        ButtonCustom(
                            height: 25.h,
                            widht: 70.w,
                            fontSize: 13.sp,
                            isWithLoading: true,
                            loadingState: value.isLoadingLoadTitle,
                            onPressed: () => controller.createNewAccount(
                                email: email,
                                accountType: value.selectedAccountType,
                                domain: value2.data!.domain!,
                                firstName: name,
                                password: password,
                                userPosition: position.text,
                                userDepartement:
                                    value.selectedDept!.departement!),
                            buttonLabel: "Create")
                      ],
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      );
    },
  );
}
