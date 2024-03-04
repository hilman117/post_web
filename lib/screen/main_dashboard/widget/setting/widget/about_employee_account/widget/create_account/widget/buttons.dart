import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:post_web/const.dart';

import '../../../../../../../../../../firebase/firebase_account.dart';

class Buttons {
  Widget createButton({
    required FirebaseAccount createAccount,
    required BuildContext context,
    required SettingsController value,
  }) {
    // final controller = Provider.of<FirebaseAccount>(context, listen: false);
    // var data = Provider.of<GeneralData>(context, listen: false);
    // var color = userColor..shuffle();
    // int index = Random().nextInt(userColor.length);
    return InkWell(
      // onTap: () => controller.createNewAccount(
      //     email: value.emailController,
      //     password: value.passworController,
      //     firstName: value.firstNameController,
      //     lastName: value.lastNameController,
      //     context: context,
      //     userPosition: value.selectedPosition,
      //     userDepartement: value.selecteddepartement,
      //     domain: data.domain!,
      //     accountType: value.selectedAccountType,
      //     colorUser: color[index]),
      child: Material(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey,
        child: Container(
          height: 44.h,
          decoration: BoxDecoration(
            color: mainColor2,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create",
                style: GoogleFonts.sarabun(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              SizedBox(
                width: 4.w,
              ),
              createAccount.isLoading
                  ? Transform.scale(
                      scale: 0.3,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ))
                  : Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 16.sp,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget succesButton() {
    return Material(
      borderRadius: BorderRadius.circular(4),
      color: Colors.grey,
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Success",
              style: GoogleFonts.sarabun(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            SizedBox(
              width: 4.w,
            ),
            Icon(
              Icons.check_outlined,
              color: Colors.white,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
