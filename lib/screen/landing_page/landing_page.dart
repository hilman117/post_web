import 'package:flutter/material.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/desktop_screen.dart';
import 'package:post_web/screen/landing_page/screen_type/phone/phon_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    double webScreen = MediaQuery.of(context).size.width;
    double sizePhone = 965.0;
    return webScreen <= sizePhone ? const PhoneScreen() : const DesktopScreen();
  }
}
