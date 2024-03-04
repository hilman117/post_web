import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/reusable_widget/item_list.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:post_web/reusable_widget/pop_up_mac.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../firebase/firebase_account.dart';
import '../../../../../../../../models/departement.dart';
import '../../../../../../../../const.dart';
import 'widget/buttons.dart';
import 'widget/register_form.dart';

createAccountDialog(
  BuildContext context,
) {
  var data = Provider.of<List<Departement>>(context, listen: false);
  // var generalData = Provider.of<GeneralData>(context, listen: false);
  final controller = Provider.of<SettingsController>(context, listen: false);
  final theme = Theme.of(context);
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
        surfaceTintColor: theme.cardColor,
        insetPadding: const EdgeInsets.all(0),
        content: Consumer3<SettingsController, MainDashboardController,
            FirebaseAccount>(
          builder: (context, settingCtrl, mainCtrl, accountCtrl, child) =>
              GestureDetector(
            onTap: () => controller.focus(positionFocuse: false),
            child: Stack(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                  width: 450.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: theme.cardColor),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.bold,
                                color: theme.canvasColor),
                          )),
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          child: Text(
                            "Create an account for your team member to increase service, communication, coordination between staff to increase fast and excellent service.",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                                color: theme.canvasColor),
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.start,
                          )),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        children: [
                          FormRegister(
                            textController: settingCtrl.firstNameController,
                            label: 'First Name',
                            hint: 'Alexan',
                            width: 187.w,
                          ),
                          SizedBox(
                            width: 28.w,
                          ),
                          FormRegister(
                            textController: settingCtrl.lastNameController,
                            label: 'Last Name',
                            hint: 'Doe',
                            width: 187.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      FormRegister(
                        emailDoamin: Container(
                          width: 200.w,
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 5.h),
                            decoration: BoxDecoration(
                                color: theme.hoverColor,
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              mainCtrl.data!.domain!,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.normal,
                                  color: theme.canvasColor),
                            ),
                          ),
                        ),
                        textController: settingCtrl.emailController,
                        label: "Email Address",
                        hint: "johndoe",
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      FormRegister(
                        textController: settingCtrl.passworController,
                        isObsecure: true,
                        label: "Create Password",
                        hint: "Your Password",
                        iconData: Icon(
                          Icons.visibility_outlined,
                          size: 16.sp,
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      optionForm(
                        context: context,
                        hintText: 'Select Position',
                        label: "Position",
                        selectedItem: settingCtrl.selectedPosition,
                        focusFunction: () =>
                            controller.focus(positionFocuse: true),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      optionForm(
                        context: context,
                        label: "Account Type",
                        selectedItem: settingCtrl.selectedAccountType,
                        hintText: "Administrator",
                        focusFunction: () =>
                            controller.focus(accounTypeFocus: true),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      optionForm(
                        context: context,
                        label: "Define group for this user",
                        selectedItem: settingCtrl.selecteddepartement,
                        hintText: "Select Departement",
                        focusFunction: () =>
                            controller.focus(departementFocus: true),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      accountCtrl.success
                          ? Buttons().succesButton()
                          : Buttons().createButton(
                              createAccount: accountCtrl,
                              context: context,
                              value: controller,
                            ),
                    ],
                  ),
                ),
                //these are widget popup that using stack widget.
                //popup suggestion for role position
                settingCtrl.isPosition
                    ? Positioned(
                        top: 300.h,
                        child: PopUpMac(
                          maxHeight: 500.h,
                          listItem: List.generate(
                              role.length,
                              (index) => InkWell(
                                    onTap: () =>
                                        controller.selectPosition(role[index]),
                                    child: ItemList(
                                      onEnterHover: (event) {
                                        controller.selectIndex(
                                            hoverIndex: index);
                                        controller.hovering(true);
                                      },
                                      onExitHover: (event) =>
                                          controller.hovering(false),
                                      valueController: settingCtrl,
                                      index: index,
                                      items: role[index],
                                    ),
                                  )),
                        ),
                      )
                    : const SizedBox(),
                //popup suggestion for account type
                settingCtrl.isAccountTypeFocus
                    ? Positioned(
                        top: 350.h,
                        child: PopUpMac(
                          // maxHeight: 300.h,
                          listItem: List.generate(
                              settingCtrl.accountType.length,
                              (index) => InkWell(
                                    onTap: () => controller.selectAccountType(
                                        settingCtrl.accountType[index]),
                                    child: ItemList(
                                      onEnterHover: (event) {
                                        controller.selectIndex(
                                            hoverIndex: index);
                                        controller.hovering(true);
                                      },
                                      onExitHover: (event) =>
                                          controller.hovering(false),
                                      valueController: settingCtrl,
                                      index: index,
                                      items: settingCtrl.accountType[index],
                                    ),
                                  )),
                        ),
                      )
                    : const SizedBox(),
                //popup suggestion for departement
                settingCtrl.isDepartement
                    ? Positioned(
                        top: 350.h,
                        child: PopUpMac(
                          maxHeight: 300.h,
                          listItem: List.generate(data.length, (index) {
                            Departement dept = data[index];
                            return InkWell(
                              onTap: () => controller
                                  .selectdepartement(dept.departement!),
                              child: ItemList(
                                valueController: settingCtrl,
                                index: index,
                                items: dept.departement!,
                                onEnterHover: (event) {
                                  controller.selectIndex(hoverIndex: index);
                                  controller.hovering(true);
                                },
                                onExitHover: (event) =>
                                    controller.hovering(false),
                              ),
                            );
                          }),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        )),
  );
}

Widget optionForm(
    {required BuildContext context,
    required String label,
    required String selectedItem,
    required String hintText,
    required VoidCallback focusFunction}) {
  final theme = Theme.of(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
            fontSize: 18.sp,
            color: theme.canvasColor,
            fontWeight: FontWeight.normal),
      ),
      InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: focusFunction,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          height: 40.h,
          // alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(width: 1.w, color: Colors.grey),
              borderRadius: BorderRadius.circular(4)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 40.h,
                child: Text(
                  selectedItem == "" ? hintText : selectedItem,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                      color: theme.canvasColor),
                ),
              ),
              const Spacer(),
              Icon(CupertinoIcons.chevron_up_chevron_down, size: 30.sp)
            ],
          ),
        ),
      ),
    ],
  );
}
