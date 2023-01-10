import 'package:flutter/material.dart';
import 'package:post_web/screen/landing_page/widget/phone/phone_home_section/phone_screen.dart';

import 'package:post_web/screen/landing_page/widget/phone/phone_home_section/widget/appbar_phone_screen.dart';
import 'package:post_web/screen/landing_page/widget/phone/phone_home_section/widget/custom_drawer.dart';
import 'package:provider/provider.dart';
import 'controller/home_section_controller.dart';
import 'widget/desktop/widget/appbar_desktop.dart';
import 'widget/desktop/widget/benefit_to_hotel/benefit_to_hotel.dart';
import 'widget/desktop/widget/dasboard_and_reports/dashboard_and_reports.dart';
import 'widget/desktop/widget/feature_section/feature_section.dart';
import 'widget/desktop/widget/footer_section/footer_section.dart';
import 'widget/desktop/widget/home_section/home_section.dart';
import 'widget/desktop/widget/preview_section/preview_section.dart';
import 'widget/tablet/home_section_tablet/tab_home_section.dart';
import 'widget/tablet/appbar_tablet.dart';
import 'widget/tablet/tab_benefit_to_hotel/benefit_to_hotel.dart';
import 'widget/tablet/tab_dasboard_and_reports/tab_dashboard_and_reports.dart';
import 'widget/tablet/tab_footer_section/tab_footer_section.dart';
import 'widget/tablet/tab_preview_section/tab_preview_section.dart';
import 'widget/tablet/tablet_feature/tablet_feature.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late ScrollController scrollController;
  double pixels = 0.0;
  List<int> scrollExperience = [];

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      setState(() {
        pixels = scrollController.position.pixels;
        scrollExperience.addAll([pixels.toInt()]);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller =
        Provider.of<HomeSectionController>(context, listen: false);
    double webScreen = MediaQuery.of(context).size.width;
    double tabletScreen = 820.0;
    double phoneScreen = 414.0;
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: webScreen < phoneScreen
          ? const Drawer(
              child: CustomDrawe(),
            )
          : const SizedBox(),
      extendBodyBehindAppBar: true,
      floatingActionButton: pixels > 200
          ? FloatingActionButton.small(
              onPressed: () => controller.scrollToSection(scrollController, 0),
              child: const Icon(Icons.arrow_upward_sharp))
          : const SizedBox(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: (pixels > 95)
            ? Colors.white
            : (webScreen < phoneScreen)
                ? Colors.white
                : const Color(0xdd3152D9),
        title: webScreen < phoneScreen
            ? const AppBarPhoneScreen()
            : webScreen <= tabletScreen
                ? AppBarTablet(
                    pixels: pixels,
                    size: size,
                    controller: controller,
                    scrollController: scrollController)
                : AppBarDesktop(
                    pixels: pixels,
                    size: size,
                    controller: controller,
                    scrollController: scrollController),
      ),
      backgroundColor: Colors.white,
      body: webScreen < phoneScreen
          ? const PhoneScreen()
          : ListView(
              controller: scrollController,
              children: [
                webScreen <= tabletScreen
                    ? const TabHomeSection()
                    : HomeSection(scrollController: scrollController),
                webScreen <= tabletScreen
                    ? TabletFeatures(pixels: pixels.toInt())
                    : FeatureSection(
                        scrollExperience: scrollExperience, pixels: pixels),
                webScreen <= tabletScreen
                    ? BenefitToHotelTablet(pixels: pixels.toInt())
                    : const BenefitToHotel(),
                webScreen <= tabletScreen
                    ? const TabPreviewSection()
                    : const PreviewSection(),
                webScreen <= tabletScreen
                    ? TabDashBoardAndReports(
                        scrollExperience: scrollExperience, pixels: pixels)
                    : DashBoardAndReports(
                        scrollExperience: scrollExperience, pixels: pixels),
                webScreen <= tabletScreen
                    ? TabFooterSection(scrollController: scrollController)
                    : FooterSection(scrollController: scrollController)
              ],
            ),
    );
  }
}
