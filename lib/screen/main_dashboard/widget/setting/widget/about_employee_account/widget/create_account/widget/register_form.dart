import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/style.dart';

class FormRegister extends StatelessWidget {
  const FormRegister({
    Key? key,
    required this.label,
    required this.hint,
    this.iconData,
    this.isObsecure,
    this.width,
    this.onFocusChange,
    this.textController,
    this.onChanged,
    this.textDirection,
    this.emailDoamin,
  }) : super(key: key);
  final String label;
  final String hint;
  final Widget? iconData;
  final Widget? emailDoamin;
  final bool? isObsecure;
  final double? width;
  final void Function(String)? onChanged;
  final TextEditingController? textController;
  final void Function(bool)? onFocusChange;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 70.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: style18Normal,
          ),
          SizedBox(
            height: 4.h,
          ),
          SizedBox(
            height: 40.h,
            child: Focus(
              onFocusChange: onFocusChange,
              child: TextFormField(
                autofocus: true,
                textDirection: textDirection ?? TextDirection.ltr,
                onChanged: onChanged,
                controller: textController,
                obscureText: false,
                style: style15Normal,
                cursorWidth: 1,
                cursorHeight: 15.h,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    suffixIcon: (iconData != null && emailDoamin == null)
                        ? iconData
                        : (iconData == null && emailDoamin != null)
                            ? emailDoamin
                            : const SizedBox(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.5.h),
                    hintText: hint,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: Color(0xff64748B))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                            const BorderSide(color: Color(0xff64748B)))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
