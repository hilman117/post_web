import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_web/other.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/left_point.dart';
import 'package:post_web/screen/landing_page/screen_type/desktop/widget/right_point.dart';

class DashBoardAndReports extends StatelessWidget {
  final List<double> scrollExperience;
  final double pixels;
  const DashBoardAndReports(
      {Key? key, required this.scrollExperience, required this.pixels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      child: LayoutBuilder(
        builder: (p0, p1) => Padding(
          padding: EdgeInsets.symmetric(
              horizontal: p1.maxWidth * 0.1, vertical: p1.maxWidth * 0.1),
          child: Column(
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: (scrollExperience.contains(1800))
                    ? 1.0
                    : (pixels >= 1800)
                        ? 1.0
                        : 0.0,
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 500),
                  padding: EdgeInsets.only(
                      top: (scrollExperience.contains(1800))
                          ? 0.0
                          : (pixels >= 1800)
                              ? 0.0
                              : 50.0),
                  child: Text("DASHBOARD & REPORT",
                      style: GoogleFonts.poppins(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff333333))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: (scrollExperience.contains(2000))
                        ? 1.0
                        : (pixels >= 2000)
                            ? 1.0
                            : 0.0,
                    child: AnimatedPadding(
                      duration: const Duration(milliseconds: 800),
                      padding: EdgeInsets.only(
                          right: (scrollExperience.contains(2000))
                              ? 0.0
                              : (pixels >= 2000)
                                  ? 0.0
                                  : 80.0),
                      child: Image.asset("image/report.png",
                          width: p1.maxWidth * 0.5),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: (scrollExperience.contains(2000))
                        ? 1.0
                        : (pixels >= 2000)
                            ? 1.0
                            : 0.0,
                    child: AnimatedPadding(
                        duration: const Duration(milliseconds: 800),
                        padding: EdgeInsets.only(
                            left: (scrollExperience.contains(2000))
                                ? 0.0
                                : (pixels >= 2000)
                                    ? 0.0
                                    : 80.0),
                        child: RightPoint(
                          title: "Realtime",
                          subtitle:
                              "Real time dashboards for operators to view pending and closed requests",
                          imageIcon: "image/accessanywhere.png",
                          color: mainColor,
                          textboxSize: p1.maxWidth * 0.1,
                          imageIconSize: p1.maxWidth * 0.1,
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: (scrollExperience.contains(2500))
                        ? 1.0
                        : (pixels >= 2500)
                            ? 1.0
                            : 0.0,
                    child: AnimatedPadding(
                        duration: const Duration(milliseconds: 800),
                        padding: EdgeInsets.only(
                            right: (scrollExperience.contains(2500))
                                ? 0.0
                                : (pixels >= 2500)
                                    ? 0.0
                                    : 80.0),
                        child: LeftPoint(
                          title: "Analytics",
                          subtitle:
                              "Report shows analytics for request families, departments, location, etc",
                          imageIcon: "image/analisys-report.png",
                          color: mainColor,
                          textBoxSize: p1.maxWidth * 0.1,
                          imageIconSize: p1.maxWidth * 0.1,
                        )),
                  ),
                  AnimatedOpacity(
                      duration: const Duration(milliseconds: 800),
                      opacity: (scrollExperience.contains(2500))
                          ? 1.0
                          : (pixels >= 2500)
                              ? 1.0
                              : 0.0,
                      child: AnimatedPadding(
                          duration: const Duration(milliseconds: 800),
                          padding: EdgeInsets.only(
                              left: (scrollExperience.contains(2500))
                                  ? 0.0
                                  : (pixels >= 2500)
                                      ? 0.0
                                      : 80.0),
                          child: Image.asset("image/report.png",
                              width: p1.maxWidth * 0.5))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
