import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

import '../controller_login_page.dart';

class FormPassword extends StatelessWidget {
  final TextEditingController controller;

  final String hintext;
  final IconData prefixIcon;
  const FormPassword({
    Key? key,
    required this.controller,
    required this.hintext,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(
      builder: (context, value, child) => Container(
        alignment: Alignment.center,
        height: 55.h,
        width: 570.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: mainColor2.withOpacity(0.2)),
        child: TextFormField(
          keyboardType: TextInputType.text,
          autofillHints: const [AutofillHints.password],
          style: style20Normal,
          cursorWidth: 1,
          cursorColor: mainColor,
          obscureText: value.isObsecure,
          controller: controller,
          cursorHeight: 20.h,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              isDense: true,
              hintText: hintext,
              border: InputBorder.none,
              prefixIcon: Icon(
                prefixIcon,
                size: 20.sp,
              ),
              suffixIcon: InkWell(
                  radius: 20.sp,
                  borderRadius: BorderRadius.circular(50),
                  onTap: () =>
                      Provider.of<LoginController>(context, listen: false)
                          .obsecureext(),
                  child: value.isObsecure
                      ? Icon(
                          Icons.visibility_off_outlined,
                          size: 20.sp,
                        )
                      : Icon(
                          Icons.visibility_outlined,
                          size: 20.sp,
                        ))),
        ),
      ),
    );
  }
}
