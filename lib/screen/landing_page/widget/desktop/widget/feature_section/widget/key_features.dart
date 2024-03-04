import 'package:flutter/material.dart';
import 'package:post_web/const.dart';

import '../../../../../widget/left_point.dart';
import '../../../../../widget/right_point.dart';

class KeyFeatures extends StatelessWidget {
  final double pixels;
  final List<int> scrollExperience;
  const KeyFeatures(
      {Key? key, required this.scrollExperience, required this.pixels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double webScreen = size.width;
    double sizePhone = 1000.0;
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 0,
                ),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 800),
                  opacity: pixels > 600
                      ? 1.0
                      : (pixels >= 600)
                          ? 1.0
                          : 0.0,
                  child: AnimatedPadding(
                    duration: const Duration(milliseconds: 800),
                    padding: EdgeInsets.only(
                        top: (scrollExperience.contains(600))
                            ? 0
                            : (pixels >= 600)
                                ? 0
                                : 870),
                    child: SizedBox(
                      width: size.width * 0.3,
                      child: LayoutBuilder(
                        builder: (p0, p1) => Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            LeftPoint(
                              title: "Task Management For All Departments",
                              subtitle: forAllDepartment,
                              imageIcon: "images/for-all-department.png",
                              color: mainColor,
                              textBoxSize: p1.maxWidth * 0.75,
                              imageIconSize: p1.maxWidth * 0.15,
                              left: MainAxisAlignment.start,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            LeftPoint(
                              title: "Easy-to-use Mobile App",
                              subtitle: easyToUse,
                              imageIcon: "images/easy-to-use.png",
                              textBoxSize: p1.maxWidth * 0.75,
                              color: secondaryColor,
                              imageIconSize: p1.maxWidth * 0.15,
                              left: MainAxisAlignment.start,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            LeftPoint(
                              title: "Analysis Report",
                              subtitle: analysReport,
                              imageIcon: "images/analisys-report.png",
                              textBoxSize: p1.maxWidth * 0.75,
                              color: mainColor,
                              imageIconSize: p1.maxWidth * 0.15,
                              left: MainAxisAlignment.start,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            webScreen <= sizePhone
                                ? const SizedBox()
                                : LeftPoint(
                                    title: "Auto-dispatch Request",
                                    subtitle: autoDispatch,
                                    imageIcon: "images/dispatch-request.png",
                                    textBoxSize: p1.maxWidth * 0.75,
                                    color: secondaryColor,
                                    imageIconSize: p1.maxWidth * 0.15,
                                    left: MainAxisAlignment.start,
                                  ),
                          ],
                        ),
                      ),
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
                    child: SizedBox(
                      width: size.width * 0.2,
                      child: LayoutBuilder(
                        builder: (p0, p1) => Image.asset(
                          "images/mockup123.png",
                          width: p1.maxWidth * 1,
                        ),
                      ),
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
                      top: (scrollExperience.contains(600))
                          ? 0
                          : (pixels >= 600)
                              ? 0
                              : 0),
                  child: SizedBox(
                    width: size.width * 0.3,
                    child: LayoutBuilder(
                      builder: (p0, p1) => Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RightPoint(
                            title: "Scheduled Maintenance",
                            subtitle: maintananceSchedule,
                            imageIcon: "images/schedule_maintainance.png",
                            color: secondaryColor,
                            textboxSize: p1.maxWidth * 0.75,
                            imageIconSize: p1.maxWidth * 0.15,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RightPoint(
                            imageIconSize: p1.maxWidth * 0.15,
                            title: "13 languages",
                            subtitle: multiLanguage,
                            imageIcon: "images/13-language.png",
                            color: mainColor,
                            textboxSize: p1.maxWidth * 0.75,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RightPoint(
                            imageIconSize: p1.maxWidth * 0.15,
                            textboxSize: p1.maxWidth * 0.75,
                            title: "Escalation Rules",
                            subtitle: escalationRule,
                            imageIcon: "images/escalation.png",
                            color: secondaryColor,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RightPoint(
                            imageIconSize: p1.maxWidth * 0.15,
                            title: "Multiple Property Management",
                            subtitle: multiProperty,
                            imageIcon: "images/multi-property.png",
                            color: mainColor,
                            textboxSize: p1.maxWidth * 0.75,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RightPoint(
                            imageIconSize: p1.maxWidth * 0.15,
                            title: "Full Cloud Platform",
                            subtitle: cloud,
                            imageIcon: "images/cloud-system.png",
                            color: secondaryColor,
                            textboxSize: p1.maxWidth * 0.75,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          webScreen <= sizePhone
                              ? const SizedBox()
                              : RightPoint(
                                  textboxSize: p1.maxWidth * 0.75,
                                  title: "Web desktop",
                                  subtitle: webDesktop,
                                  imageIcon: "images/web-destop.png",
                                  color: mainColor,
                                  imageIconSize: p1.maxWidth * 0.15,
                                )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          webScreen >= sizePhone
              ? const SizedBox()
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.5,
                      child: LayoutBuilder(
                        builder: (p0, p1) => LeftPoint(
                          title: "Auto-dispatch Request",
                          subtitle: autoDispatch,
                          imageIcon: "images/dispatch-request.png",
                          textBoxSize: p1.maxWidth * 0.75,
                          color: secondaryColor,
                          imageIconSize: p1.maxWidth * 0.15,
                          left: MainAxisAlignment.start,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      child: LayoutBuilder(
                        builder: (p0, p1) => RightPoint(
                          textboxSize: p1.maxWidth * 0.75,
                          title: "Web desktop",
                          subtitle: webDesktop,
                          imageIcon: "images/web-destop.png",
                          color: mainColor,
                          imageIconSize: p1.maxWidth * 0.15,
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
