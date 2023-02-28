import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:post_web/firebase/post/account_controller.dart';
import 'package:post_web/models/user.dart';
import 'package:post_web/other.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/employee_account/widget/widget/create_account/widget/register_form.dart';
import 'package:post_web/style.dart';
import 'package:post_web/common_widget/photo_profile.dart';
import 'package:provider/provider.dart';

import '../create_account/widget/popup_suggestion.dart';

editEmployeeProfile(BuildContext context, UserDetails dataEmployee) {
  final accountController =
      Provider.of<AccountController>(context, listen: false);
  final settingController =
      Provider.of<SettingsController>(context, listen: false);
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content:
          Consumer<AccountController>(builder: (context, accountValue, child) {
        return Consumer<SettingsController>(
          builder: (context, settingValue, child) => Stack(
            children: [
              Container(
                width: 300,
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PhotoProfile(
                        lebar: 50.w,
                        tinggi: 50.h,
                        radius: 50.sp,
                        urlImage: dataEmployee.profileImage!),
                    SizedBox(
                      height: 30.h,
                    ),
                    FormRegister(
                      label: "Name",
                      hint: accountValue.name,
                      textController: accountValue.editName,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    FormRegister(
                      label: "Email",
                      hint: accountValue.email,
                      textController: accountValue.editEmail,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    FormRegister(
                      label: "Position",
                      hint: accountValue.position,
                      textController: TextEditingController.fromValue(
                        TextEditingValue(
                            text: settingValue.selectedPosition,
                            selection: TextSelection(
                              baseOffset: settingValue.selectedPosition.length,
                              extentOffset:
                                  settingValue.selectedPosition.length,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    FormRegister(
                      onFocusChange: (p0) =>
                          settingController.focus(departementFocus: p0),
                      label: "Departement",
                      hint: accountValue.department,
                      textController: TextEditingController.fromValue(
                        TextEditingValue(
                            text: settingValue.selecteddepartement,
                            selection: TextSelection(
                              baseOffset:
                                  settingValue.selecteddepartement.length,
                              extentOffset:
                                  settingValue.selecteddepartement.length,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              settingValue.isPosition
                  ? PopUpSuggestion(
                      leftPosition: 0.w,
                      topPosition: 120.h,
                      child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          itemCount: settingValue.role.length,
                          itemBuilder: (context, index) {
                            if (settingValue.role[index].toLowerCase().contains(
                                settingValue.selectedPosition.toLowerCase())) {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  child: Text(
                                    settingValue.role[index],
                                    style: style15Normal,
                                  ),
                                ),
                              );
                            }
                            return const SizedBox();
                          }),
                    )
                  : const SizedBox(),
              settingValue.isDepartement
                  ? PopUpSuggestion(
                      leftPosition: 24.w,
                      topPosition: 450.h,
                      height: 200.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        itemCount: settingValue.departments.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: Text(
                              settingValue.departments[index],
                              style: style15Normal,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        );
      }),
      actions: [
        Consumer<AccountController>(
            builder: (context, accountValue, child) =>
                Consumer<SettingsController>(
                    builder: (context, settingvalue, child) => InkWell(
                          onTap: () => accountController.editAccount(
                              newName: accountValue.editName.text != ""
                                  ? accountValue.editName.text
                                  : accountValue.name,
                              newPosition: settingvalue.selectedPosition != ""
                                  ? settingvalue.selectedPosition
                                  : accountValue.position,
                              newEmail: accountValue.editEmail.text != ""
                                  ? accountValue.editEmail.text
                                  : accountValue.email,
                              newDepartement:
                                  settingvalue.selecteddepartement != ""
                                      ? settingvalue.selecteddepartement
                                      : accountValue.department,
                              currentImageProfile: dataEmployee.profileImage!),
                          child: Container(
                            color: mainColor2,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.white),
                            ),
                          ),
                        )))
      ],
    ),
  );
}
