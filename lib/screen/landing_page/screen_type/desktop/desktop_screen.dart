import 'package:flutter/material.dart';
import 'package:post_web/screen/landing_page/controller/home_section_controller.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/benefit_to_hotel/benefit_to_hotel.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/dasboard_and_reports/dashboard_and_reports.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/feature_section/feature_section.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/footer_section/footer_section.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/home_section/home_section.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/preview_section/preview_section.dart';
import 'package:provider/provider.dart';
import 'widget/appbar_desktop.dart';

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
  late ScrollController scrollController;
  double pixels = 0.0;
  List<double> scrollExperience = [];

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    scrollController = ScrollController();
    scrollController.addListener(() {
      setState(() {
        pixels = scrollController.position.pixels;
        scrollExperience.addAll([pixels]);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller =
        Provider.of<HomeSectionController>(context, listen: false);
    return Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: pixels > 200
            ? FloatingActionButton.small(
                onPressed: () =>
                    controller.scrollToSection(scrollController, 0),
                child: const Icon(Icons.arrow_upward_sharp))
            : const SizedBox(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: pixels > 95 ? Colors.white : const Color(0xdd3152D9),
          title: AppBarDesktop(
              pixels: pixels,
              size: size,
              controller: controller,
              scrollController: scrollController),
        ),
        backgroundColor: Colors.white,
        body: SizedBox.expand(
          child: ListView(
            controller: scrollController,
            children: [
              HomeSection(scrollController: scrollController),
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
              FooterSection(
                scrollController: scrollController,
              )
            ],
          ),
        ));
  }
}
