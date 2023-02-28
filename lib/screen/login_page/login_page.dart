import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/login_page/controller_login_page.dart';

import 'package:post_web/other.dart';
import 'package:post_web/screen/login_page/widget/form_password.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';
import 'widget/form_email.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Provider.of<LoginController>(context, listen: false);
    final emailController = TextEditingController(text: controller.getEmail);
    final passwordController =
        TextEditingController(text: controller.getPassword);
    return Consumer<LoginController>(
        builder: (context, value, child) => Scaffold(
              body: Center(
                child: SizedBox(
                  height: size.height,
                  width: size.width,
                  child: AutofillGroup(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "image/logo.png",
                          width: 200.sp,
                          // height: p1.maxHeight * 0.,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "Hotel Internal Messaging System",
                          style: style20Normal,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          width: 570.w,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Login",
                            style: style24SemiBold,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        FormEmail(
                          controller: emailController,
                          hintext: "Email",
                          prefixIcon: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        FormPassword(
                          controller: passwordController,
                          hintext: "Password",
                          prefixIcon: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: 570.w,
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot my password",
                                style: TextStyle(
                                    color: Colors.lightBlue, fontSize: 15.sp),
                              )),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 570.w,
                          child: Row(
                            children: [
                              Checkbox(
                                value: value.isSave,
                                onChanged: (value) =>
                                    controller.isSaveValue(value!),
                              ),
                              Text(
                                "Remember me",
                                style: style20Normal,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () => controller.signIn(context,
                              emailController.text, passwordController.text),
                          child: Container(
                            alignment: Alignment.center,
                            height: 55.h,
                            width: 570.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mainColor),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
