import 'package:flutter/material.dart';
import 'package:post_web/screen/main_dashboard.dart';
import 'package:post_web/screen/my_app/screen_size/desktop_screen.dart';
import 'package:post_web/screen/my_app/screen_size/phon_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    double webScreen = MediaQuery.of(context).size.width;
    double sizePhone = 965.0;
    return const MainDashboard();
    // webScreen <= sizePhone ? const PhoneScreen() : const DesktopScreen();
  }
}
