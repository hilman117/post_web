import 'package:flutter/material.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/desktop_screen.dart';

import 'package:post_web/screen/landing_page/screen_type/tablet/widget/tablet_widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    double webScreen = MediaQuery.of(context).size.width;
    double tabletScreen = 820.0;
    double phoneScreen = 700.0;
    return webScreen <= tabletScreen
        ? const TabletScreen()
        : const DesktopScreen();
  }
}
