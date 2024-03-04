import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/login_page/controller_login_page.dart';
import 'package:post_web/const.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context, listen: false);

    final theme = Theme.of(context);
    return Consumer<LoginController>(
        builder: (context, val, child) => Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            body: Center(
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 50.sp, vertical: 50.sp),
                width: 700.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.grey, width: 0.3),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 5.0),
                          color: Colors.grey.withOpacity(0.3))
                    ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "images/Project1.png",
                      height: 250.h,
                      width: 250.w,
                    ),
                    SelectableText(
                      "Hotel Intenal Messaging System",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SelectableText(
                      "Please sign in to get access.",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.normal),
                    ),
                    AutofillGroup(
                      child: Column(
                        children: [
                          TextFormField(
                            autofillHints: const [AutofillHints.email],
                            cursorWidth: 1,
                            controller: emailController,
                            cursorHeight: 20.h,
                            cursorColor: mainColor,
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  fontSize: 23.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Colors.grey.shade200), // Custom color
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        mainColor), // Custom color when focused
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          TextFormField(
                            autofillHints: const [AutofillHints.password],
                            cursorWidth: 1,
                            controller: passwordController,
                            cursorHeight: 20.h,
                            cursorColor: mainColor,
                            onEditingComplete: () =>
                                TextInput.finishAutofillContext(),
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  fontSize: 23.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Colors.grey.shade200), // Custom color
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        mainColor), // Custom color when focused
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    SizedBox(
                        height: 50.h,
                        width: double.infinity,
                        child: CupertinoButton(
                            onPressed: val.loadingSignInProgress
                                ? () {}
                                : () => controller.signIn(
                                    context,
                                    emailController.text,
                                    passwordController.text),
                            color: mainColor,
                            padding: EdgeInsets.all(4.sp),
                            child: val.loadingSignInProgress
                                ? SizedBox(
                                    height: 13.h,
                                    width: 13.sp,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 1,
                                      color: Colors.white,
                                    ))
                                : Text(
                                    "Sign In",
                                    style: TextStyle(
                                        fontSize: 20.sp, color: Colors.white),
                                  )))
                  ],
                ),
              ),
            )));
  }
}
