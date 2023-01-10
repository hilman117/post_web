import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../other.dart';

import '../../../screen_type/tablet/tablet_feature/animated_features/right_feature_animated.dart';
import 'animated_features/left_feature_animated.dart';

class TabletFeatures extends StatelessWidget {
  final int pixels;
  const TabletFeatures({Key? key, required this.pixels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        child: LayoutBuilder(
          builder: (p0, p1) => Padding(
            padding: EdgeInsets.symmetric(horizontal: p1.maxWidth * 0.05),
            child: Column(
              children: [
                Text("FEATURES",
                    style: GoogleFonts.poppins(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff333333))),
                const SizedBox(
                  height: 30,
                ),
                LeftFeatureAnimated(
                    pixels: pixels,
                    p1: p1,
                    title: "Task Management For All Departments",
                    subTitle: forAllDepartment,
                    imageIcon: "image/for-all-department.png",
                    position: 563),
                const SizedBox(
                  height: 30,
                ),
                RightFeatureAnimated(
                    pixels: pixels,
                    position: 650,
                    p1: p1,
                    title: "Easy-to-use Mobile App",
                    subTitle: easyToUse,
                    imageIcon: "image/easy-to-use.png"),
                const SizedBox(
                  height: 30,
                ),
                LeftFeatureAnimated(
                    pixels: pixels,
                    p1: p1,
                    title: "Analysis Report",
                    subTitle: analysReport,
                    imageIcon: "image/analisys-report.png",
                    position: 761),
                const SizedBox(
                  height: 30,
                ),
                RightFeatureAnimated(
                    pixels: pixels,
                    position: 917,
                    p1: p1,
                    title: "Auto-dispatch Request",
                    subTitle: autoDispatch,
                    imageIcon: "image/dispatch-request.png"),
                const SizedBox(
                  height: 30,
                ),
                AnimatedPadding(
                  duration: const Duration(milliseconds: 500),
                  padding: EdgeInsets.only(top: pixels > 1169 ? 0 : 150),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: pixels > 1057 ? 1 : 0,
                    child: SizedBox(
                      width: size.width * 0.4,
                      child: LayoutBuilder(
                        builder: (p0, p1) => Image.asset(
                          "image/mockup123.png",
                          width: p1.maxWidth * 1,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                LeftFeatureAnimated(
                    pixels: pixels,
                    p1: p1,
                    title: "Scheduled Maintenance",
                    subTitle: maintananceSchedule,
                    imageIcon: "image/schedule_maintainance.png",
                    position: 1713),
                const SizedBox(
                  height: 30,
                ),
                RightFeatureAnimated(
                    pixels: pixels,
                    position: 1854,
                    p1: p1,
                    title: "13 languages",
                    subTitle: multiLanguage,
                    imageIcon: "image/13-language.png"),
                const SizedBox(
                  height: 30,
                ),
                LeftFeatureAnimated(
                    pixels: pixels,
                    p1: p1,
                    title: "Escalation Rules",
                    subTitle: escalationRule,
                    imageIcon: "image/escalation.png",
                    position: 2024),
                const SizedBox(
                  height: 30,
                ),
                RightFeatureAnimated(
                    pixels: pixels,
                    position: 2154,
                    p1: p1,
                    title: "Multiple Property Management",
                    subTitle: multiProperty,
                    imageIcon: "image/multi-property.png"),
                const SizedBox(
                  height: 30,
                ),
                LeftFeatureAnimated(
                    pixels: pixels,
                    p1: p1,
                    title: "Web desktop",
                    subTitle: webDesktop,
                    imageIcon: "image/web-destop.png",
                    position: 2335),
              ],
            ),
          ),
        ));
  }
}
