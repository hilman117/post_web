import 'package:flutter/material.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/benefit_to_hotel/benefit_to_hotel.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/dasboard_and_reports/dashboard_and_reports.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/feature_section/feature_section.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/footer_section/footer_section.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/home_section/home_section.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/preview_section/preview_section.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({Key? key}) : super(key: key);

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  Color mainColor = const Color(0xff3152D9);
  bool selectedPage = true;
  bool appstoreIsHover = false;
  bool playstoreIsHover = false;
  // ignore: non_constant_identifier_names
  bool IsRegisterHover = false;
  bool isLoginHover = false;
  bool isHomeHover = false;
  bool isFeatureHover = false;
  bool isPreviewHover = false;
  bool isReportHover = false;
  late ScrollController controller;
  double pixels = 0.0;
  List<double> scrollExperience = [];

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    controller = ScrollController();
    controller.addListener(() {
      setState(() {
        pixels = controller.position.pixels;
        scrollExperience.addAll([pixels]);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            const HomeSection(),
            FeatureSection(
                tabController: tabController,
                scrollExperience: scrollExperience,
                pixels: pixels),
            const SizedBox(height: 60),
            const BenefitToHotel(),
            const SizedBox(height: 30),
            const PreviewSection(),
            DashBoardAndReports(
                scrollExperience: scrollExperience, pixels: pixels),
            const FooterSection()
          ],
        ),
      ),
    );
  }
}
