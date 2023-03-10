import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/reusable_widget/pop_up_mac.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:post_web/models/user.dart';
import 'package:post_web/const.dart';
import 'package:post_web/style.dart';
import 'package:post_web/reusable_widget/photo_profile_network.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../firebase/firebase_account.dart';
import '../../../../../../../../models/departement.dart';
import '../create_account/widget/popup_suggestion.dart';
import '../create_account/widget/register_form.dart';

editEmployeeProfile(BuildContext context, UserDetails dataEmployee) {
  var data = Provider.of<List<Departement>>(context, listen: false);
  final accountController =
      Provider.of<FirebaseAccount>(context, listen: false);
  final settingController =
      Provider.of<SettingsController>(context, listen: false);
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content:
          Consumer<FirebaseAccount>(builder: (context, accountValue, child) {
        return Consumer<SettingsController>(
          builder: (context, settingValue, child) => Stack(
            children: [
              Container(
                width: 300,
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PhotoProfileNetWork(
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
                          itemCount: role.length,
                          itemBuilder: (context, index) {
                            if (role[index].toLowerCase().contains(
                                settingValue.selectedPosition.toLowerCase())) {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  child: Text(
                                    role[index],
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
                  ? PopUpMac(
                      listItem: List.generate(data.length, (index) {
                      Departement dept = data[index];
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: Text(
                            dept.departement!,
                            style: style15Normal,
                          ),
                        ),
                      );
                    })
                      // ListView.builder(
                      //         shrinkWrap: true,
                      //         padding: const EdgeInsets.all(0),
                      //         itemCount: data.length,
                      //         itemBuilder: (context, index) {
                      //           Departement dept = data[index];
                      //           return
                      //         }),
                      )
                  : const SizedBox()
            ],
          ),
        );
      }),
      actions: [
        Consumer<FirebaseAccount>(
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
