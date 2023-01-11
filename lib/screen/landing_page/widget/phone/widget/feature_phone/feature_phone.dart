import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/screen/landing_page/widget/phone/widget/feature_phone/animated_features/right_feature_animated.dart';
import '../../../../../../other.dart';

import 'animated_features/left_feature_animated.dart';

class PhoneFeatures extends StatelessWidget {
  final int pixels;
  const PhoneFeatures({Key? key, required this.pixels}) : super(key: key);

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
                AnimatedPadding(
                  duration: const Duration(milliseconds: 500),
                  padding: EdgeInsets.only(top: pixels > 46 ? 0 : 150),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: pixels > 46 ? 1 : 0,
                    child: Text("FEATURES",
                        style: GoogleFonts.poppins(
                            fontSize: p1.maxWidth * 0.030,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff333333))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                LeftFeatureAnimated(
                    pixels: pixels,
                    p1: p1,
                    title: "Task Management For All Departments",
                    subTitle: forAllDepartment,
                    imageIcon: "image/for-all-department.png",
                    position: 139),
                const SizedBox(
                  height: 30,
                ),
                RightFeatureAnimated(
                    pixels: pixels,
                    position: 351,
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
                    position: 496),
                const SizedBox(
                  height: 30,
                ),
                RightFeatureAnimated(
                    pixels: pixels,
                    position: 618,
                    p1: p1,
                    title: "Auto-dispatch Request",
                    subTitle: autoDispatch,
                    imageIcon: "image/dispatch-request.png"),
                const SizedBox(
                  height: 30,
                ),
                AnimatedPadding(
                  duration: const Duration(milliseconds: 500),
                  padding: EdgeInsets.only(top: pixels > 798 ? 0 : 150),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: pixels > 798 ? 1 : 0,
                    child: SizedBox(
                      width: size.width * 0.4,
                      child: LayoutBuilder(
                        builder: (p0, p1) => Image.asset(
                          "image/mokap.png",
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
                    position: 1052),
                const SizedBox(
                  height: 30,
                ),
                RightFeatureAnimated(
                    pixels: pixels,
                    position: 1133,
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
                    position: 1250),
                const SizedBox(
                  height: 30,
                ),
                RightFeatureAnimated(
                    pixels: pixels,
                    position: 1430,
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
                    position: 1497),
              ],
            ),
          ),
        ));
  }
}
