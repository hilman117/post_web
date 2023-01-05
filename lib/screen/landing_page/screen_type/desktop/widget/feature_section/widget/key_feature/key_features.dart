import 'package:flutter/material.dart';
import 'package:post_web/other.dart';

import '../../../left_point.dart';
import '../../../right_point.dart';

class KeyFeatures extends StatelessWidget {
  final double pixels;
  final List<double> scrollExperience;
  const KeyFeatures(
      {Key? key, required this.scrollExperience, required this.pixels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 70,
            ),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: (scrollExperience.contains(600))
                  ? 1.0
                  : (pixels >= 600)
                      ? 1.0
                      : 0.0,
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 800),
                padding: EdgeInsets.only(
                    left: (scrollExperience.contains(600))
                        ? 0
                        : (pixels >= 600)
                            ? 0
                            : 870),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LeftPoint(
                      title: "Task Management For All Departments",
                      subtitle: forAllDepartment,
                      imageIcon: "image/for-all-department.png",
                      color: mainColor,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    LeftPoint(
                      title: "Easy-to-use Mobile App",
                      subtitle: easyToUse,
                      imageIcon: "image/easy-to-use.png",
                      color: secondaryColor,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    LeftPoint(
                      title: "Analysis Report",
                      subtitle: analysReport,
                      imageIcon: "image/analisys-report.png",
                      color: mainColor,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    LeftPoint(
                      title: "Auto-dispatch Request",
                      subtitle: autoDispatch,
                      imageIcon: "image/dispatch-request.png",
                      color: secondaryColor,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    LeftPoint(
                      title: "Web desktop",
                      subtitle: webDesktop,
                      imageIcon: "image/web-destop.png",
                      color: mainColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: (scrollExperience.contains(600))
                  ? 1.0
                  : (pixels >= 600)
                      ? 1.0
                      : 0.0,
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 800),
                padding: EdgeInsets.only(
                    top: (scrollExperience.contains(600))
                        ? 0.0
                        : (pixels >= 600)
                            ? 0.0
                            : 70.0),
                child: Image.asset(
                  "image/mokap2.png",
                  width: 300,
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 800),
            opacity: (scrollExperience.contains(600))
                ? 1.0
                : (pixels >= 600)
                    ? 1.0
                    : 0.0,
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 800),
              padding: EdgeInsets.only(
                  left: (scrollExperience.contains(600))
                      ? 870
                      : (pixels >= 600)
                          ? 870
                          : 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RightPoint(
                    title: "Scheduled Maintenance",
                    subtitle: maintananceSchedule,
                    imageIcon: "image/schedule_maintainance.png",
                    color: secondaryColor,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RightPoint(
                    title: "13 languages",
                    subtitle: multiLanguage,
                    imageIcon: "image/13-language.png",
                    color: mainColor,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RightPoint(
                    title: "Escalation Rules",
                    subtitle: escalationRule,
                    imageIcon: "image/escalation.png",
                    color: secondaryColor,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RightPoint(
                    title: "Multiple Property Management",
                    subtitle: multiProperty,
                    imageIcon: "image/multi-property.png",
                    color: mainColor,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RightPoint(
                    title: "Full Cloud Platform",
                    subtitle: cloud,
                    imageIcon: "image/cloud-system.png",
                    color: secondaryColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
