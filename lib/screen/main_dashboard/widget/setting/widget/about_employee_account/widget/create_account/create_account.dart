import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/models/general_data.dart';
import 'package:post_web/reusable_widget/item_list.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:post_web/reusable_widget/pop_up_mac.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../firebase/firebase_account.dart';
import '../../../../../../../../models/departement.dart';
import 'widget/buttons.dart';
import 'widget/register_form.dart';

createAccountDialog(
  BuildContext context,
) {
  var data = Provider.of<List<Departement>>(context, listen: false);
  var generalData = Provider.of<GeneralData>(context, listen: false);
  final controller = Provider.of<SettingsController>(context, listen: false);
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
        content: Consumer<SettingsController>(
      builder: (context, value, child) => GestureDetector(
        onTap: () => controller.focus(positionFocuse: false),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              width: 450.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      child: Text(
                        "Create Account",
                        style: style24SemiBold,
                      )),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      child: Text(
                        "Create an account for your team member to increase service, communication, coordination between staff to increase fast and excellent service.",
                        style: style15Normal,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.start,
                      )),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      FormRegister(
                        textController: value.firstNameController,
                        label: 'First Name',
                        hint: 'Alexan',
                        width: 187.w,
                      ),
                      SizedBox(
                        width: 28.w,
                      ),
                      FormRegister(
                        textController: value.lastNameController,
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
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          generalData.domain!,
                          style: style15Normal,
                        ),
                      ),
                    ),
                    textController: value.emailController,
                    label: "Email Address",
                    hint: "johndoe",
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  FormRegister(
                    textController: value.passworController,
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
                  OptionForm(
                    hintText: 'Select Position',
                    label: "Position",
                    selectedItem: value.selectedPosition,
                    focusFunction: () => controller.focus(positionFocuse: true),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  OptionForm(
                    label: "Account Type",
                    selectedItem: value.selectedAccountType,
                    hintText: "Administrator",
                    focusFunction: () =>
                        controller.focus(accounTypeFocus: true),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  OptionForm(
                    label: "Define group for this user",
                    selectedItem: value.selecteddepartement,
                    hintText: "Select Departement",
                    focusFunction: () =>
                        controller.focus(departementFocus: true),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Consumer<FirebaseAccount>(
                    builder: (context, value, child) => value.success
                        ? Buttons().succesButton()
                        : Buttons().createButton(
                            createAccount: value,
                            context: context,
                            value: controller,
                          ),
                  )
                ],
              ),
            ),
            //these are widget popup that using stack widget.
            //popup suggestion for role position
            value.isPosition
                ? Positioned(
                    top: 300.h,
                    child: PopUpMac(
                      maxHeight: 500.h,
                      listItem: List.generate(
                          value.role.length,
                          (index) => InkWell(
                                onTap: () => controller
                                    .selectPosition(value.role[index]),
                                child: ItemList(
                                  onEnterHover: (event) {
                                    controller.selectIndex(hoverIndex: index);
                                    controller.hovering(true);
                                  },
                                  onExitHover: (event) =>
                                      controller.hovering(false),
                                  valueController: value,
                                  index: index,
                                  items: value.role[index],
                                ),
                              )),
                    ),
                  )
                : const SizedBox(),
            //popup suggestion for account type
            value.isAccountTypeFocus
                ? Positioned(
                    top: 350.h,
                    child: PopUpMac(
                      // maxHeight: 300.h,
                      listItem: List.generate(
                          value.accountType.length,
                          (index) => InkWell(
                                onTap: () => controller.selectAccountType(
                                    value.accountType[index]),
                                child: ItemList(
                                  onEnterHover: (event) {
                                    controller.selectIndex(hoverIndex: index);
                                    controller.hovering(true);
                                  },
                                  onExitHover: (event) =>
                                      controller.hovering(false),
                                  valueController: value,
                                  index: index,
                                  items: value.accountType[index],
                                ),
                              )),
                    ),
                  )
                : const SizedBox(),
            //popup suggestion for departement
            value.isDepartement
                ? Positioned(
                    top: 350.h,
                    child: PopUpMac(
                      maxHeight: 300.h,
                      listItem: List.generate(data.length, (index) {
                        Departement dept = data[index];
                        return InkWell(
                          onTap: () =>
                              controller.selectdepartement(dept.departement!),
                          child: ItemList(
                            valueController: value,
                            index: index,
                            items: dept.departement!,
                            onEnterHover: (event) {
                              controller.selectIndex(hoverIndex: index);
                              controller.hovering(true);
                            },
                            onExitHover: (event) => controller.hovering(false),
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

class OptionForm extends StatelessWidget {
  const OptionForm({
    Key? key,
    required this.label,
    required this.selectedItem,
    required this.hintText,
    required this.focusFunction,
  }) : super(key: key);

  final String label;
  final String selectedItem;
  final String hintText;
  final VoidCallback focusFunction;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: style18Normal,
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
                    style: style15Normal,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  "image/dropdown.png",
                  width: 30.w,
                  height: 30.h,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
